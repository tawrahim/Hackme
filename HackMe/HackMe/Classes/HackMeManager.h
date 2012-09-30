//
//  PompManager.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

#import "HackMeManagerDelegate.h"
#import "HackMeCommunicatorDelegate.h"

@class HackMeCommunicator, VideoBuilder;

@interface HackMeManager : NSObject <HackMeCommunicatorDelegate>
@property (weak) id<HackMeManagerDelegate> delegate;
@property (strong) HackMeCommunicator *communicator;
@property (strong) VideoBuilder *videoBuilder;

- (void)fetchFeedFromYoutube;
@end
