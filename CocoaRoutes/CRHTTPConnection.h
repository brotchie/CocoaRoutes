//
//  CRHttpConnection.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <CocoaHTTPServer/HTTPConnection.h>

@class CRMapper;

@interface CRHTTPConfig : HTTPConfig
@property (readonly, nonatomic)CRMapper *mapper;
- (id)initWithServer:(HTTPServer *)server documentRoot:(NSString *)documentRoot queue:(dispatch_queue_t)q mapper:(CRMapper *)mapper;
@end

@interface CRHTTPConnection : HTTPConnection

@end
