//
//  PompCommunicator.h
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import <Foundation/Foundation.h>

#import "HackMeCommunicatorDelegate.h"

@interface HackMeCommunicator : NSObject
@property (weak) id<HackMeCommunicatorDelegate> delegate;

- (void)searchForVideoFromYoutube;
@end
