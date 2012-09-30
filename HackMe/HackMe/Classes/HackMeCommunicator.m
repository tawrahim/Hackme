//
//  PompCommunicator.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "HackMeCommunicator.h"

@implementation HackMeCommunicator

- (void)searchForVideoFromYoutube
{
    NSURL *url = [NSURL URLWithString:@"http://vimeo.com/api/v2/brad/appears_in.json"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (!error) {
            [self.delegate receiveVideosFromYoutubeJSON:data];
            
        } else {
            [self.delegate searchVideosFromYoutubeFailedWithError:error];
        }
    }];
}



@end
