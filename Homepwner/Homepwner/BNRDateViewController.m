//
//  BNRDateViewController.m
//  Homepwner
//
//  Created by Dominique on 12/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRDateViewController.h"
#import "BNRItem.h"

@interface BNRDateViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDateViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.date = self.item.dateCreated;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    item.dateCreated = [self.datePicker date];
}
@end
