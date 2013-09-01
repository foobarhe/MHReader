//
//  Data.m
//  MHReader
//
//  Created by Min He on 9/1/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import "Data.h"

@implementation Data

- (id)initWithFeedsPath:(NSString *)fPath ArticlePath:(NSString *)aPath
{
    self = [super init];
    if (self) {
        self.feedsDict = [[NSMutableDictionary alloc] initWithContentsOfFile:fPath];
        self.articlesDict = [[NSMutableDictionary alloc] initWithContentsOfFile:aPath];
        return self;
    }
    return nil;
}

- (Boolean)fetchArticles
{
    if (self.feedsDict == nil) {
        return NO;
    }
    if (self.articlesDict == nil) {
        self.articlesDict = [[NSMutableDictionary alloc] init];
    }
    
    for (id key in self.feedsDict) {
        NSString *name = (NSString *)key;
        NSString *urlStr = [self.feedsDict objectForKey:key];
        NSLog(@"name: %@, url: %@", name, urlStr);
        
        //send request in sycn way
        NSURL *url = [NSURL URLWithString:urlStr];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        //get articles of this feed (NSXMLParser is sync)
        self.articles = nil;
        if (error == nil) {
            self.articles = [[NSMutableArray alloc] init];
            self.isInItem = NO;
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:responseData];
            [parser setDelegate:self];
            [parser setShouldResolveExternalEntities:NO];
            [parser parse];
        }
        [self.articlesDict setObject:self.articles forKey:name];
        NSLog(@"articlesDict: %@", self.articlesDict);
        
    }
    return YES;
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    self.nodeName = elementName;
    if ([self.nodeName isEqualToString:@"item"]) {
        self.isInItem = YES;
        self.article = [[NSMutableDictionary alloc] init];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSString *tmp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([self.nodeName isEqualToString:@"title"] && self.isInItem) {
        [self.article setObject:tmp forKey:@"title"];
    }
    else if ([self.nodeName isEqualToString:@"pubDate"] && self.isInItem) {
        [self.article setObject:tmp forKey:@"time"];
    }
    else if ([self.nodeName isEqualToString:@"link"] && self.isInItem) {
        [self.article setObject:tmp forKey:@"url"];
    }
    else if ([self.nodeName isEqualToString:@"description"] && self.isInItem) {
        [self.article setObject:tmp forKey:@"summary"];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        //got one article
        [self.articles addObject:self.article];
        self.isInItem = NO;
        self.article = nil;
    }
}



@end
