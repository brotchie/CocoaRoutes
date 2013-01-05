//
//  AppDelegate.m
//  CocoaRoutesExample
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "AppDelegate.h"
#import <CocoaRoutes.h>

@implementation AppDelegate {
    CRHTTPServer *_server;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CRMapper *mapper = [[CRMapper alloc] init];
    [mapper connect:@"/greet/:name/:message" controller:[CRBlockController get:^NSString *(HTTPMessage *message, NSDictionary *args) {
        return [NSString stringWithFormat:@"Hello %@, %@.\r\n", args[@"name"], args[@"message"]];
    }]];

    _server = [[CRHTTPServer alloc] initWithMapper:mapper];
    _server.port = 8080;
    
    NSError *error;
    [_server start:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
