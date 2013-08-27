//
//  IndexVC.m
//  MHReader
//
//  Created by Min He on 8/27/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import "IndexVC.h"
#import "Feed.h"
#import "Article.h"

@interface IndexVC ()

@property (nonatomic, strong) NSMutableArray *entryAry;

@end

@implementation IndexVC

- (void)initEntryAry
{
    Feed *f1 = [[Feed alloc] initWithId:@"1" name:@"互联网" url:@"http://it.com"];
    Article *f1a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f1a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];

    Feed *f2 = [[Feed alloc] initWithId:@"2" name:@"Android" url:@"http://it.com"];
    Article *f2a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f2a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];

    Feed *f3 = [[Feed alloc] initWithId:@"3" name:@"雅虎" url:@"http://it.com"];
    Article *f3a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f3a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    
    self.entryAry = [[NSMutableArray alloc] initWithObjects:f1, f1a1, f1a2, f2, f2a1, f2a2, f3, f3a1, f3a2, nil];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"News";
    [self initEntryAry];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.entryAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    id entry = [self.entryAry objectAtIndex:indexPath.row];
    if ([entry isKindOfClass:[Feed class]]) {
        cell.textLabel.text = ((Feed *)entry).name;
    }
    else {
        cell.textLabel.text = ((Article *)entry).title;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
