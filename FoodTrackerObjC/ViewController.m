//
//  ViewController.m
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/23/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self nameTextField] setDelegate:self]; //set text field delagate
    
}

-(void)showImagePicker:(NSString*)source {
    
    //create an image picker
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    //set the photo source type
    if ([source isEqualToString:@"Photo Library"]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    //set the delegate to current class
    [imagePicker setDelegate:self];
    //present the image picker view
    [self presentViewController:imagePicker animated:YES completion:^(void){}];
    
}

//meal image tapped
- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    [[self nameTextField] resignFirstResponder]; //hide the keyboard
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Edit photo" message:@"Add or remove photo for your meal" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *choosePhotoAction = [UIAlertAction actionWithTitle:@"Choose from Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
        [self showImagePicker:@"Photo Library"];
    }];
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {
        [self showImagePicker:@"Take Photo"];
    }];
    UIAlertAction *removePhotoAction = [UIAlertAction actionWithTitle:@"Remove photo" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action) {
        [[self photoImageView] setImage:[UIImage imageNamed:@"NoImage"]];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){}];
    
    
    [alert addAction:choosePhotoAction];
    [alert addAction:takePhotoAction];
    [alert addAction:removePhotoAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:^(void){}];
    
}

//when the user presses Cancel button in image picker view
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //dismiss the image picker
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

//when user selects a photo
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //get selected image
    UIImage *selectedImage = (UIImage*)[info objectForKey:UIImagePickerControllerOriginalImage];
    //set the meal photo view
    [[self photoImageView] setImage:selectedImage];
    //dismiss the image picker
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

//pressing the Done button on keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[self mealNameLabel] setText:[textField text]];
    [textField resignFirstResponder]; //hide the keyboard
    return YES;
}

//when the user inputs text to the meal name text field
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //perform text check - meal name should contain only english letters and spaces
    for (int i = 0; i < [string length]; i++) {
        //if the deprecated symbol is found - return NO (value of text field won't change)
        if (([string characterAtIndex:i] < 'A' || [string characterAtIndex:i] > 'z') && [string characterAtIndex:i] != ' ') {
            
            return NO;
        }
    }
    return YES;
}

@end
