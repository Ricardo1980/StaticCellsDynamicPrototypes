//
//  TestTableViewController.m
//  Test
//
//  Created by Ricardo Ruiz on 21/01/13.
//  Copyright (c) 2013 Ricardo Ruiz. All rights reserved.
//

#import "TestTableViewController.h"
#import "CustomCell.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"--- numberOfRowsInSection%d", section);
    if (section==1) {
        return 5;
    } else {
        return [super tableView:tableView numberOfRowsInSection:section];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        // Works perfectly
        static NSString *cellIdentifier = @"NormalCell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text=@"Not custom cell";
        return cell;
        
        // Don't work
        /*
        static NSString *cellIdentifier = @"CustomCell";
        CustomCell *cell=(CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.testLabel.text=@"testing custom cell";
        return cell;
        */

    } else {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

#pragma mark - Table view delegate

// indentationLevelForRowAtIndexPath and heightForRowAtIndexPath must be implemented otherwise mixing static cells with prototype cells fails (don't know the reason)

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = indexPath.section;
    if (section == 1) {
        return [super tableView:tableView indentationLevelForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    } else {
        return [super tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
