//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Dominique on 16/04/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

+ (NSArray *)colors
{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
}

- (IBAction)changeColor:(UISegmentedControl *)sender
{
    self.hypnosisView.circleColor = [BNRHypnosisViewController colors][sender.selectedSegmentIndex];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}

@end
