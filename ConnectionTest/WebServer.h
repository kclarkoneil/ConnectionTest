//
//  WebServer.h
//  PlantConnection
//
//  Created by Kit Clark-O'Neil on 2020-07-09.
//  Copyright © 2020 Christopher Clark-O'Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"
#import "GCDWebServerURLEncodedFormRequest.h"
#import "GCDWebServerMultiPartFormRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface WebServer : NSObject
+ (GCDWebServer*) webServer;
+ (void) setWebServer:(GCDWebServer*)webServer;
+ (void)createServer;


@end

NS_ASSUME_NONNULL_END




