//
//  BNRHypnosisViewController.h
//  HypnoNerd
//
//  Created by Dominique on 16/04/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController : UIViewController

@property (nonatomic, weak) IBOutlet BNRHypnosisView* hypnosisView;

- (IBAction)changeColor:(UISegmentedControl *)sender;

@end
