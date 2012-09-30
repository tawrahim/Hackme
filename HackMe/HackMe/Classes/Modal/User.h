//
//  User.h
//  HackMe
//
//  Created by TAMIM Ziad on 9/30/12.
//  Copyright (c) 2012 TAMIM Ziad && Tawheed abdul-raheeem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong) NSString *userName;
@property (strong) NSURL *avatarUrl;

- (id)initWithUserName:(NSString *)aUserName avatarLocation:(NSString *)location;
@end
