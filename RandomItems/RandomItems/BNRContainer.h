//
//  BNRContainer.h
//  RandomItems
//
//  Created by Dominique on 06/04/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSArray *_subItems;
}

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber
                       items:(NSArray *)items;

@end
