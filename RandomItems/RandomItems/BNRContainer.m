//
//  BNRContainer.m
//  RandomItems
//
//  Created by Dominique on 06/04/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)initWithName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *)sNumber
                       items:(NSArray *)items
{
    if (self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber]) {
        for (BNRItem *item in items) {
            self.valueInDollars += item.valueInDollars;
        }
        _subItems = [items copy];
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    return [self initWithName:name valueInDollars:value serialNumber:sNumber items:@[]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ containing %@", [super description], _subItems];
}

@end
