//
//  BNRLine.m
//  TouchTracker
//
//  Created by Dominique on 17/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRLine.h"

@implementation BNRLine

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGPoint:self.begin forKey:@"begin"];
    [aCoder encodeCGPoint:self.end forKey:@"end"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _begin = [aDecoder decodeCGPointForKey:@"begin"];
        _end = [aDecoder decodeCGPointForKey:@"end"];
    }
    return self;
}
@end
