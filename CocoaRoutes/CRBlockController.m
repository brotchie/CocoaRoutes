//
//  CRBlockController.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutes.h"

@implementation CRBlockController {
    CRControllerBlock _get;
    CRControllerBlock _post;
}

- (id)initWithGet:(CRControllerBlock)get post:(CRControllerBlock)post {
    self = [super init];
    if (self) {
        _get = get;
        _post = post;
    }
    return self;
}

+ (CRBlockController *)get:(CRControllerBlock)get {
    return [[CRBlockController alloc] initWithGet:get post:nil];
}

+ (CRBlockController *)post:(CRControllerBlock)post {
    return [[CRBlockController alloc] initWithGet:nil post:post];
}

+ (CRBlockController *)get:(CRControllerBlock)get post:(CRControllerBlock)post {
    return [[CRBlockController alloc] initWithGet:get post:post];
}

- (NSString *)get:(HTTPMessage *)message args:(NSDictionary *)args {
    if (_get) {
        return _get(message, args);
    } else {
        return nil;
    }
}

- (NSString *)post:(HTTPMessage *)message args:(NSDictionary *)args {
    if (_post) {
        return _post(message, args);
    } else {
        return nil;
    }
}

@end
