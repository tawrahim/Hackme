//
//  UIImageView+Network.m
//  ZTNetworkImageView
//
//  Created by TAMIM Ziad iMAC on 17/06/12.
//  Copyright (c) 2012 TAMIM Ziad. All rights reserved.
//

#import "UIImageView+Network.h"

@implementation UIImageView (Network)

- (NSMutableDictionary *)cache {
    static NSMutableDictionary *_cache = nil;
    
#define MAX_IMAGE_CAPACITY 20
    
    if (!_cache) {
        _cache = [[NSMutableDictionary alloc] initWithCapacity:MAX_IMAGE_CAPACITY];
    }
    return _cache;
}

- (void)imageFetcherWithUrl:(NSURL *)url 
{
    @autoreleasepool {
        
        @try {
            NSError *error = nil;
            NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
            
            if (error) {
                NSLog(@"Error : %@",[error localizedDescription]);
            } else {
                
                // Remove the images when gets the limit
                if ([[self cache] count] >= MAX_IMAGE_CAPACITY) {
                    [[self cache] removeAllObjects];
                }
                
                [self setImage:[UIImage imageWithData:data]];
                [[self cache] setObject:data forKey:url];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"Error Thread : %@",[exception reason]);
        }
        @finally {
            
        }
        
    }
}

- (void)loadImageWithUrl:(NSURL *)url 
{
    if ([[self cache] objectForKey:url]) {
        [self setImage:[UIImage imageWithData:[[self cache] objectForKey:url]]];
        
    } else {
        [self performSelectorInBackground:@selector(imageFetcherWithUrl:) withObject:url];
    }
}

@end
