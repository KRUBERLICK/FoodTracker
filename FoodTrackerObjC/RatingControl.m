//
//  RatingControl.m
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/24/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

// MARK: Initialization
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    //initialize the superclass
    self = [super initWithCoder:aDecoder];
    _buttonSize = self.frame.size.height;
    _spacing = 5;
    _buttonCount = 5;
    _ratingButtons = [NSMutableArray arrayWithCapacity:_buttonCount];
    UIImage *filledStarImage = [UIImage imageNamed:@"filledStar"];
    UIImage *emptyStarImage = [UIImage imageNamed:@"emptyStar"];
    for (int i = 0; i < [self buttonCount]; i++) {
        //create a button
        UIButton *button = [[UIButton alloc] init];
        //declare button's frame square
        CGRect buttonFrame = CGRectMake(0, 0, [self buttonSize], [self buttonSize]);
        //calculate the offset of x-coordinate
        buttonFrame.origin.x = i * ([self buttonSize] + [self spacing]);
        //set the frame to the button object
        [button setFrame:buttonFrame];
        //set background color to red
        //[button setBackgroundColor:[UIColor redColor]];
        //link the tap action with ratingButtonTapped: method
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
        //set empty star image for normal state
        [button setImage:emptyStarImage forState:UIControlStateNormal];
        //set filled star image for selected state
        [button setImage:filledStarImage forState:UIControlStateSelected];
        //set filled star image for highlighted and selected state
        [button setImage:filledStarImage forState:(UIControlStateHighlighted + UIControlStateSelected)];
        [button setAdjustsImageWhenHighlighted:NO];
        //add button to rating buttons array
        [[self ratingButtons] addObject:button];
        //add button to view
        [self addSubview:button];
    }
    [self updateButtonSelectionStates];
    //return the initialized view
    return self;
}
//method for setting the intrinsic content size of a view
-(CGSize)intrinsicContentSize {
    return CGSizeMake(240, 44);
}
//tapping the rating button
-(void)ratingButtonTapped:(UIButton*)button {
    if ([self rating] == [[self ratingButtons] indexOfObject:button] + 1) {
        [self setRating:0];
    } else {
        [self setRating:[[self ratingButtons] indexOfObject:button] + 1];
    }
    [self updateButtonSelectionStates];
}
//update buttin selection states
-(void)updateButtonSelectionStates {
    for (int i = 0; i < [[self ratingButtons] count]; i++) {
        [[[self ratingButtons] objectAtIndex:i] setSelected:(i < [self rating])];
    }
}
//observer for rating property
//to make sure that button states will be always in-time with property change
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"rating"]) {
        [self updateButtonSelectionStates];
    }
}
@end
