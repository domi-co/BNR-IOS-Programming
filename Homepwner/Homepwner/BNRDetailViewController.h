//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Dominique on 12/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) BNRItem *item;

@end
