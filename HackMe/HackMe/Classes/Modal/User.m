//
//  User.m
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import "User.h"

@implementation User
- (id)initWithUserName:(NSString *)aUserName avatarLocation:(NSString *)location
{
    if ((self = [super init])) {
        _userName = aUserName;
        _avatarUrl = [NSURL URLWithString:location];
    }
    
    return self;
}

@end
