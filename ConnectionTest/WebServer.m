//
//  WebServer.m
//  PlantConnection
//
//  Created by Kit Clark-O'Neil on 2020-07-09.
//  Copyright © 2020 Christopher Clark-O'Neil. All rights reserved.
//

#import "WebServer.h"
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"

@implementation WebServer

static GCDWebServer *webServer;
+ (GCDWebServer*) webServer
{ @synchronized(self) { return webServer; } }
+ (void) setWebServer:(GCDWebServer *)server
{ @synchronized(self) { webServer = server; } }

+ (void)createServer {
    webServer = [[GCDWebServer alloc] init];
 
      
      // Add a handler to respond to GET requests on any URL
    NSString* formHTML = @" \
      <form name=\"input\" action=\"/\" method=\"post\" enctype=\"multipart/form-data\"> \
      <input type=\"hidden\" name=\"secret\" value=\"42\"> \
      <input type=\"file\" name=\"files\" multiple><br/> \
      <input type=\"submit\" value=\"Submit\"> \
      </form> \
    ";
    [webServer addHandlerForMethod:@"GET"
                              path:@"/"
                      requestClass:[GCDWebServerRequest class]
                      processBlock:^GCDWebServerResponse*(GCDWebServerRequest* request) {
                        NSString* html = [NSString stringWithFormat:@"<html><body>%@</body></html>", formHTML];
                        NSLog(@"Received GET Request");
                       
                        
                        return [GCDWebServerDataResponse responseWithHTML:html];
                      }];
    [webServer addHandlerForMethod:@"POST"
                              path:@"/"
                      requestClass:[GCDWebServerMultiPartFormRequest class]
                      processBlock:^GCDWebServerResponse*(GCDWebServerRequest* request) {
                        NSMutableString* string = [NSMutableString string];
                        for (GCDWebServerMultiPartArgument* argument in [(GCDWebServerMultiPartFormRequest*)request arguments]) {
                          [string appendFormat:@"%@, %@", argument.controlName, argument.string];
                            NSLog(@" %@", string);
                        }
                        for (GCDWebServerMultiPartFile* file in [(GCDWebServerMultiPartFormRequest*)request files]) {
                          NSDictionary* attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:file.temporaryPath error:NULL];
                          [string appendFormat:@"%@ = &quot;%@&quot; (%@ | %llu %@)<br>", file.controlName, file.fileName, file.mimeType,
                                               attributes.fileSize >= 1000 ? attributes.fileSize / 1000 : attributes.fileSize,
                                               attributes.fileSize >= 1000 ? @"KB" : @"Bytes"];
                        };
                        NSString* html = [NSString stringWithFormat:@"<html><body><p>%@</p><hr>%@</body></html>", string, formHTML];
                
                        return [GCDWebServerDataResponse responseWithHTML:html];
                      }];


    
    // Start server on port 8080
         [webServer startWithPort:8080 bonjourName:nil];
         NSLog(@"Visit %@ in your web browser", webServer.serverURL);
    }

@end
