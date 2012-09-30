//
//  VideoBuilder.m
//  Pomp
//
//  Created by TAMIM Ziad on 9/29/12.
//
//

#import "VideoBuilder.h"

#import "Video.h"
#import "User.h"

@implementation VideoBuilder

- (NSArray *)videosFromJSON:(NSData *)objectNotaion error:(NSError **)error
{
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:objectNotaion options:0 error:&localError];
    NSArray *videos = (id)jsonObject;
    
    if (!videos) {
        // VideoBuilderInvalidJSONError

        return nil;
    }
    
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:[videos count]];
    for (NSDictionary *parsedVideo in videos) {
        Video *video = [[Video alloc] initWithTitle:[parsedVideo valueForKey:@"title"] description:[parsedVideo valueForKey:@"description"]
                                     avatarLocation:[NSURL URLWithString:[parsedVideo valueForKey:@"thumbnail_medium"]]
                                      videoLocation:[NSURL URLWithString:[parsedVideo valueForKey:@"mobile_url"]]];
        [video setVideoID:[parsedVideo valueForKey:@"id"]];
        
        User *uploader = [[User alloc] initWithUserName:[parsedVideo valueForKey:@"user_name"]
                                     avatarLocation:[parsedVideo valueForKey:@"user_portrait_medium"]];
        [video setUploader:uploader];
        [results addObject:video];
    }
    
    return [results copy];
}

@end
