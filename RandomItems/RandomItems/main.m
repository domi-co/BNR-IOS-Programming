//
//  main.m
//  RandomItems
//
//  Created by Dominique on 03/04/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        BNRContainer *container = [[BNRContainer alloc] initWithName:@"Container" valueInDollars:50 serialNumber:@"" items:items];
        
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"container %@", container);
        
        items = nil;
    }
    return 0;
}

