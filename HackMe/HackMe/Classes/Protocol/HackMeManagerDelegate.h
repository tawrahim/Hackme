//
//  HackMeManagerDelegate.h
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HackMeManagerDelegate <NSObject>
- (void)fetchVideoFromYoutubeFailedWithError:(NSError *)error;
- (void)didReceiveVideo:(NSArray *)videos;
@end
