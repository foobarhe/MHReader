//
//  AppDelegate.h
//  MHReader
//
//  Created by Min He on 8/25/13.
//  Copyright (c) 2013 Min He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) Data *data;
@property (strong, nonatomic) UIWindow *window;

@end
