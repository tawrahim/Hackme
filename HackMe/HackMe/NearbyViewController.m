//
//  SecondViewController.m
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import "NearbyViewController.h"

#import "UIImageView+Network.h"
#import "Video.h"
#import "User.h"
#import "VideoBuilder.h"
#import "HackMeManager.h"
#import "HackMeCommunicator.h"
#import "HackMeManager.h"
#import "DisplayVideoViewController.h"

@interface NearbyViewController ()<HackMeManagerDelegate>
@property (strong) HackMeManager *manager;
@property (strong) NSArray *videos;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation NearbyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _manager = [[HackMeManager alloc] init];
    self.manager.communicator = [[HackMeCommunicator alloc] init];
    self.manager.communicator.delegate = _manager;
    self.manager.videoBuilder = [[VideoBuilder alloc] init];
    self.manager.delegate = self;
    
    [self.manager fetchFeedFromYoutube];
}

#pragma mark - Manager Delegate

- (void)fetchVideoFromYoutubeFailedWithError:(NSError *)error
{
    
}

- (void)didReceiveVideo:(NSArray *)videos
{
    self.videos = [videos copy];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.videos count];
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
    Video *video = [self.videos objectAtIndex:indexPath.row];
    
    [[cell.contentView viewWithTag:1] removeFromSuperview];
    UIImageView *avatarVideo = [[UIImageView alloc] initWithFrame:CGRectMake(27, 17, 267, 139)];
    [avatarVideo setTag:1];
    
    [avatarVideo loadImageWithUrl:video.avatarUrl];
    [cell.contentView addSubview:avatarVideo];
    
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:3];
    [titleLabel setText:video.title];
    
    [[cell.contentView viewWithTag:2] removeFromSuperview];
    UIImageView *avatarUser = [[UIImageView alloc] initWithFrame:CGRectMake(27, 162, 31, 28)];
    [avatarUser setTag:2];
    
    [avatarUser loadImageWithUrl:video.uploader.avatarUrl];
    [cell.contentView addSubview:avatarUser];
    
    UIImageView *playIcon = [[UIImageView alloc] initWithFrame:CGRectMake(131, 66, 55, 41)];
    [playIcon setImage:[UIImage imageNamed:@"play-big.png"]];
    [cell.contentView addSubview:playIcon];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowVideo"]) {
        Video *video = [self.videos objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        [[segue destinationViewController] setVideo:video];
    }
}

@end
