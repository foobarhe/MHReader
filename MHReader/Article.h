//
//  Article.h
//  MHReader
//
//  Created by Min He on 8/27/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString *iden;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *url;

- (id)initWithId:(NSString *)iden title:(NSString *)title fid:(NSString *)fid
            time:(NSString *)time summary:(NSString *)summary url:(NSString *)url;

@end
