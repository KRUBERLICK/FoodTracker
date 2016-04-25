//
//  RatingControl.h
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/24/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingControl : UIView
@property (nonatomic) NSUInteger rating; //rating value
@property (nonatomic, strong) NSMutableArray *ratingButtons; //star button array

@property (nonatomic) NSUInteger spacing; //spacing between stars
@property (nonatomic) NSUInteger buttonCount; //star count
@property (nonatomic) NSUInteger buttonSize; //star buttons size

-(void)ratingButtonTapped:(UIButton*)button; //tapping the star button
@end
