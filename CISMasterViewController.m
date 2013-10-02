//
//  CISMasterViewController.m
//  CIS
//
//  Created by Charles Konkol on 10/1/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISMasterViewController.h"
#import "CISVideoDetailViewController.h"

@interface CISMasterViewController ()
{
    NSMutableArray *_objects;
}
@end

@implementation CISMasterViewController
@synthesize list,Youtube;
- (void)awakeFromNib
{
    [super awakeFromNib];
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"My Favorite Bands";
    NSArray *listArray = [[NSArray alloc] initWithObjects:@"Video 1", @"Video 2", @"Video 2",nil];
    self.list = listArray;

    NSArray *youtube = [[NSArray alloc] initWithObjects:@"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>", @"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>", @"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>",nil];
    self.Youtube = youtube;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [list objectAtIndex:[indexPath row]];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}



// Override to support rearranging the table view.



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 [segue.destinationViewController setProductName:[list objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];

 }



@end
