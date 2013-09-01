//
//  Data.h
//  MHReader
//
//  Created by Min He on 9/1/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableDictionary *feedsDict;
@property (nonatomic, strong) NSMutableDictionary *articlesDict;

@property (strong, nonatomic) NSMutableArray *articles;
@property (strong, nonatomic) NSMutableDictionary *article;
@property (strong, nonatomic) NSString *nodeName;
@property Boolean isInItem;
@property (strong, nonatomic) NSMutableString *title;
@property (strong, nonatomic) NSMutableString *time;
@property (strong, nonatomic) NSMutableString *summary;
@property (strong, nonatomic) NSMutableString *url;

- (id)initWithFeedsPath:(NSString *)fPath ArticlePath:(NSString *)aPath;
- (Boolean)fetchArticles;

@end
