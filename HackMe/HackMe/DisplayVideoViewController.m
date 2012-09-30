//
//  DisplayVideo.m
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import "DisplayVideoViewController.h"

#import "Video.h"

@interface DisplayVideoViewController ()

@end

@implementation DisplayVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.viewBackground.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://player.vimeo.com/video/%d",[self.video.videoID intValue]]];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)viewDidUnload {
    [self setViewBackground:nil];
    [super viewDidUnload];
}
@end
