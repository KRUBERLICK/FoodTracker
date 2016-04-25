//
//  MealTableViewController.m
//  FoodTrackerObjC
//
//  Created by Данил Ильчишин on 4/25/16.
//  Copyright © 2016 KRUBERLICK. All rights reserved.
//

#import "MealTableViewController.h"
#import "Meal.h"
#import "MealTableViewCell.h"

@interface MealTableViewController ()

@end

@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _meals = [[NSMutableArray alloc] init]; //initialize meals array
    
    [self loadSampleMeals]; //load sample data
}

//method for loading sample meals
-(void)loadSampleMeals {
    
    UIImage *photo1 = [UIImage imageNamed:@"meal1"];
    UIImage *photo2 = [UIImage imageNamed:@"meal2"];
    UIImage *photo3 = [UIImage imageNamed:@"meal3"];
    
    Meal *meal1 = [[Meal alloc] initWithName:@"Caprese Salad" image:photo1 rating:4];
    Meal *meal2 = [[Meal alloc] initWithName:@"Chicken and Potatoes" image:photo2 rating:5];
    Meal *meal3 = [[Meal alloc] initWithName:@"Pasta with Meatballs" image:photo3 rating:3];
    
    [[self meals] addObject:meal1];
    [[self meals] addObject:meal2];
    [[self meals] addObject:meal3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //number of table rows is equal to meals array count
    return [[self meals] count];
}

//configure cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //dequeue cell at currrent index
    MealTableViewCell *cell = (MealTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MealTableViewCell" forIndexPath:indexPath];
    
    //get meal at current index
    Meal *meal = [[self meals] objectAtIndex:indexPath.row];
    
    //set meal cell content
    [[cell nameLabel] setText:[meal name]];
    [[cell photoImageView] setImage:[meal image]];
    [[cell ratingControl] setRating:[meal rating]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete meal from array
        [[self meals] removeObjectAtIndex:indexPath.row];
        //delete the row from the table
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
