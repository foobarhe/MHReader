//
//  Feed.h
//  MHReader
//
//  Created by Min He on 8/27/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (nonatomic, strong) NSString *iden;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

- (id)initWithId:(NSString *)iden name:(NSString *)name url:(NSString *)url;

@end
