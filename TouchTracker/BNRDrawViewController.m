//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Dominique on 17/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController()

@property (nonatomic, strong) BNRDrawView *drawView;

@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.drawView = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    self.view = self.drawView;
    self.drawView.finishedLines = [self restoreLines];
}

- (void)saveLines
{
    NSLog(@"saveLines");
    [NSKeyedArchiver archiveRootObject:self.drawView.finishedLines toFile:[self linesArchivePath]];
}

- (NSMutableArray *)restoreLines
{
    NSLog(@"restoreLines");
    NSMutableArray *lines = [NSKeyedUnarchiver unarchiveObjectWithFile:[self linesArchivePath]];
    if (!lines) {
        lines = [[NSMutableArray alloc] init];
    }
    return lines;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self saveLines];
}

- (NSString *)linesArchivePath {
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"lines.archive"];
}
@end
