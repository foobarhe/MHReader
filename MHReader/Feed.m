//
//  Feed.m
//  MHReader
//
//  Created by Min He on 8/27/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (id)initWithId:(NSString *)iden name:(NSString *)name url:(NSString *)url
{
    self = [super init];
    if (self) {
        _iden = iden;
        _name = name;
        _url = url;
        return self;
    }
    
    return nil;
}

@end
