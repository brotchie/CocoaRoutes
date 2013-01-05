//
//  CRHTTPServer.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <CocoaHTTPServer/HTTPServer.h>

@interface CRHTTPServer : HTTPServer
@property (readonly, nonatomic) CRMapper *mapper;

- (id)initWithMapper:(CRMapper *)mapper;
@end
