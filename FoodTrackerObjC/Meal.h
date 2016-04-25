//
//  Meal.h
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/25/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meal : NSObject 

@property (nonatomic, copy) NSString *name;
@property (nonatomic, weak) UIImage *image;
@property (nonatomic) NSInteger rating;

-(id)initWithName:(NSString*)name image:(UIImage*)image rating:(NSInteger)rating;

@end
