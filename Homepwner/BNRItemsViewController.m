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
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                           forIndexPath:indexPath];
    if (indexPath.row < [items count]) {
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
        cell.textLabel.font = [UIFont systemFontOfSize:20];
    } else {
        cell.textLabel.text = @"No more items!";
        cell.textLabel.font = [UIFont systemFontOfSize:17];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [[[BNRItemStore sharedStore] allItems] count]) {
        return 20.0;
    } else {
        return 60.0;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    // add a background view
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"iphone7" ofType:@"jpg"];
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:filePath];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
}

@end
