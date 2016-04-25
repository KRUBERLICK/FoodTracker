//
//  MealViewController.h
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/23/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
#import "Meal.h"

@interface MealViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic, strong) Meal *meal; //meal object to store the info about created meal

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender;
- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender;

@end

