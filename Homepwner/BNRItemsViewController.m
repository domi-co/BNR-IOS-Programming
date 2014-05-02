//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Dominique on 01/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i<5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[self smallItems] count];
    } else {
        return [[self bigItems] count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
                                 
    BNRItem *item = nil;
    if (indexPath.section == 0) {
        item = [self smallItems][indexPath.row];
    } else {
        item = [self bigItems][indexPath.row];
    }
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (NSArray *)smallItems
{
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"valueInDollars < %f", 50.0];
    return [items filteredArrayUsingPredicate:predicate];
}

- (NSArray *)bigItems
{
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"valueInDollars >= %f", 50.0];
    return [items filteredArrayUsingPredicate:predicate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

@end
