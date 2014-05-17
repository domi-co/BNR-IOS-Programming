//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Dominique on 17/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
