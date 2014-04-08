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
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil");
        items = nil;
    }
    return 0;
}

