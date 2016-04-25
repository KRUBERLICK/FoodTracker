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

-(BOOL)isLess:(int)firstNumber than:(int)secondNumber {
    if (firstNumber < secondNumber) {
        return YES;
    }
    return NO;
}

-(void)testMealInitialization {
    
    //Success case
    Meal *potentialItem = [[Meal alloc] initWithName:@"Newest meal" image:nil rating:5];
    
    XCTAssertNotNil(potentialItem);
    
    //Failure cases
    Meal *noName = [[Meal alloc] initWithName:@"" image:nil rating:0];
    
    XCTAssertNil(noName, "Empty name is invalid");
    
    Meal *badRating = [[Meal alloc] initWithName:@"Realy bad rating" image:nil rating:-1];
    
    XCTAssertNil(badRating, "Rating must be positive");
    
    XCTAssertTrue([self isLess:5 than:7]);
    XCTAssertTrue([self isLess:-5 than:0]);
    XCTAssertFalse([self isLess:1 than:1]);
    XCTAssertFalse([self isLess:7 than:-12]);
}

@end
