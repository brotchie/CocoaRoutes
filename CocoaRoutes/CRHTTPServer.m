//
//  CRHTTPServer.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutes.h"

@implementation CRHTTPServer

@synthesize mapper = _mapper;

- (id)initWithMapper:(CRMapper *)mapper {
    self = [super init];
    if (self) {
        _mapper = mapper;
        self.connectionClass = [CRHTTPConnection class];
    }
    return self;
}

- (CRHTTPConfig *)config {
    return [[CRHTTPConfig alloc] initWithServer:self documentRoot:documentRoot queue:connectionQueue mapper:_mapper];
}

@end
