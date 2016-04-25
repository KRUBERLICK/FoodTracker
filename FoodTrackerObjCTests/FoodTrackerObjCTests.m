//
//  FoodTrackerObjCTests.m
//  FoodTrackerObjCTests
//
//  Created by Данил Ильчишин on 4/23/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Meal.h"

@interface FoodTrackerObjCTests : XCTestCase

@end

@implementation FoodTrackerObjCTests

-(void)testMealInitialization {
    
    //Success case
    Meal *potentialItem = [[Meal alloc] initWithName:@"Newest meal" image:nil rating:5];
    
    XCTAssertNotNil(potentialItem);
    
    //Failure cases
    Meal *noName = [[Meal alloc] initWithName:@"" image:nil rating:0];
    
    XCTAssertNil(noName, "Empty name is invalid");
    
    Meal *badRating = [[Meal alloc] initWithName:@"Realy bad rating" image:nil rating:-1];
    
    XCTAssertNil(badRating, "Rating must be positive");
}

@end
