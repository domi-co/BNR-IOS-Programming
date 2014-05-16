//
//  BNROverlayView.m
//  Homepwner
//
//  Created by Dominique on 16/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNROverlayView.h"

@implementation BNROverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.alpha = 0.5;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(bounds.origin.x, center.y)];
    [path addLineToPoint:CGPointMake(bounds.origin.x + bounds.size.width, center.y)];
    [path moveToPoint:CGPointMake(center.x, bounds.origin.y)];
    [path addLineToPoint:CGPointMake(center.x, bounds.origin.y + bounds.size.height)];
    
    [[UIColor redColor] setStroke];
    [path stroke];
}


@end
