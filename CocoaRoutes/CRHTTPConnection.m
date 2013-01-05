//
//  CRHttpConnection.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutes.h"
#import <CocoaHTTPServer/HTTPDataResponse.h>

@implementation CRHTTPConfig

@synthesize mapper = _mapper;

- (id)initWithServer:(HTTPServer *)aServer documentRoot:(NSString *)aDocumentRoot queue:(dispatch_queue_t)q mapper:(CRMapper *)mapper {
    self = [super initWithServer:aServer documentRoot:aDocumentRoot queue:q];
    if (self) {
        _mapper = mapper;
    }
    return self;
}

@end

@implementation CRHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
    CRHTTPConfig *crConfig = (CRHTTPConfig *)config;
    NSString *response = [crConfig.mapper dispatch:request method:method URI:path];
    return [[HTTPDataResponse alloc] initWithData:[response dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
