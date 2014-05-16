//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Dominique on 16/05/2014.
//  Copyright (c) 2014 coissard.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
