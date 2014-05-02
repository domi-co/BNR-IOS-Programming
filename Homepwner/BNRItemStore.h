//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Dominique on 01/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
@end
