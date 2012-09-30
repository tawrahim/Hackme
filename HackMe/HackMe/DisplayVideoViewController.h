//
//  DisplayVideo.h
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Video;

@interface DisplayVideoViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (strong) Video *video;
@end
