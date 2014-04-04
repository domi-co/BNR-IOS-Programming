//
//  main.m
//  RandomItems
//
//  Created by Dominique on 03/04/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        [items insertObject:@"Zero" atIndex:0];
        
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        BNRItem *item = [[BNRItem alloc] init];
        item.itemName = @"Red Sofa";
        item.serialNumber = @"A1B2C";
        item.valueInDollars = 100;
        
        NSLog(@"%@", item);
        items = nil;
    }
    return 0;
}

