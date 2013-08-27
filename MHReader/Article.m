//
//  Article.m
//  MHReader
//
//  Created by Min He on 8/27/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import "Article.h"

@implementation Article

- (id)initWithId:(NSString *)iden title:(NSString *)title fid:(NSString *)fid time:(NSString *)time summary:(NSString *)summary url:(NSString *)url
{
    self = [super init];
    if (self) {
        _iden = iden;
        _title = title;
        _fid = fid;
        _time = time;
        _summary = summary;
        _url = url;
        return self;
    }
    return nil;
}

@end
