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

@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation IndexVC

- (void)initData
{
    Feed *f1 = [[Feed alloc] initWithId:@"1" name:@"互联网" url:@"http://it.com"];
    Article *f1a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f1a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    NSArray *f1Articles = [[NSArray alloc] initWithObjects:f1a1, f1a2, nil];
    NSArray *data1 = [[NSArray alloc] initWithObjects:f1, f1Articles, nil];
    
    Feed *f2 = [[Feed alloc] initWithId:@"2" name:@"Android" url:@"http://it.com"];
    Article *f2a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f2a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    NSArray *f2Articles = [[NSArray alloc] initWithObjects:f2a1, f2a2, nil];
    NSArray *data2 = [[NSArray alloc] initWithObjects:f2, f2Articles, nil];

    Feed *f3 = [[Feed alloc] initWithId:@"3" name:@"雅虎" url:@"http://it.com"];
    Article *f3a1 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    Article *f3a2 = [[Article alloc] initWithId:@"1" title:@"ffffff" fid:@"1" time:@"ssss" summary:@"summary" url:@"url"];
    NSArray *f3Articles = [[NSArray alloc] initWithObjects:f3a1, f3a2, nil];
    NSArray *data3 = [[NSArray alloc] initWithObjects:f3, f3Articles, nil];
    
    self.dataAry = [[NSMutableArray alloc] initWithObjects:data1, data2, data3, nil];
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
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //using xib to define view
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    UIView *headerView = [nib objectAtIndex:0];
    
    Feed *feed = [[self.dataAry objectAtIndex:section] objectAtIndex:0];
    UILabel *nameLabel = (UILabel *)[headerView viewWithTag:1];
    nameLabel.text = feed.name;
    
    //seperator
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    UIView *seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor colorWithWhite:224.0/255.0 alpha:1.0];
    [headerView addSubview:seperatorView];
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.dataAry count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self.dataAry objectAtIndex:section] objectAtIndex:1] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ArticleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Article *article = [[[self.dataAry objectAtIndex:[indexPath section]] objectAtIndex:1] objectAtIndex:indexPath.row];
    
    UILabel *titleLabel = (UILabel *) [cell viewWithTag:1];
    titleLabel.text = article.title;
    UILabel *summaryLabel = (UILabel *) [cell viewWithTag:2];
    summaryLabel.text = article.summary;
    
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
