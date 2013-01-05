//
//  CRMapper.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutes.h"

@implementation CRMapper {
    NSMutableArray *_routes;
}

- (id)init {
    self = [super init];
    if (self) {
        _routes = [NSMutableArray array];
    }
    return self;
}

- (CRRoute *)connect:(NSString *)path controller:(id<CRController>)controller {
    return [self connect:nil path:path controller:controller];
}

- (CRRoute *)connect:(NSString *)name path:(NSString *)path controller:(id<CRController>)controller {
    CRRoute *route = [[CRRoute alloc] initWithName:name path:path controller:controller];
    [_routes addObject:route];
    return route;
}

- (NSString *)dispatch:(HTTPMessage *)message method:(NSString *)method URI:(NSString *)path {
    CRRoute *route;
    NSDictionary *args;
    
    for (NSUInteger i = 0; i < _routes.count; i++) {
        route = _routes[i];
        args = [route match:path];
        if (args)
            break;
    }
    
    if (!args)
        return nil;
    
    if ([method isEqualToString:@"GET"] && [route.controller respondsToSelector:@selector(get:args:)]) {
        return [route.controller get:message args:args];
    } else if ([method isEqualToString:@"POST"] && [route.controller respondsToSelector:@selector(post:args:)]) {
        return [route.controller post:message args:args];
    }
    
    return nil;
}

@end
