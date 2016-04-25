//
//  ViewController.h
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/23/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *mealNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender;

@end

