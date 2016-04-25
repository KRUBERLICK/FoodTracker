//
//  Meal.m
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/25/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import "Meal.h"

@implementation Meal

-(id)initWithName:(NSString*)name image:(UIImage*)theImage rating:(NSInteger)rating {
    
    if ([name length] < 1 || rating < 0) {
        return nil;
    }
    
    _name = name;
    _image = theImage;
    _rating = rating;
    
    return self;
}

@end
