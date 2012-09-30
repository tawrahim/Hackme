//
//  HackMeCommunicatorDelegate.h
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HackMeCommunicatorDelegate <NSObject>
- (void)searchVideosFromYoutubeFailedWithError:(NSError *)error;
- (void)receiveVideosFromYoutubeJSON:(NSData *)objectNotation;
@end
