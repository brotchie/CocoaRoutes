//
//  CRRoute.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutes.h"

#import <Parcoa/Parcoa.h>

@interface CRRoute ()
- (void)parsePath;
- (NSRegularExpression *)regex;
@end

@implementation CRRoute {
    NSArray *_keys;
    NSRegularExpression *_regex;
}
@synthesize name = _name;
@synthesize path = _path;
@synthesize controller = _controller;

- (id)initWithName:(NSString *)name path:(NSString *)path controller:(id<CRController>)controller {
    self = [super init];
    if (self) {
        _name = name;
        _path = [path stringByTrimmingTrailingSlash];
        _controller = controller;
        [self parsePath];
    }
    return self;
}

- (NSDictionary *)match:(NSString *)requestPath {
    NSString *trimmedPath = [requestPath stringByTrimmingTrailingSlash];
    NSTextCheckingResult *result = [self.regex firstMatchInString:trimmedPath options:0 range:NSMakeRange(0, trimmedPath.length)];
    if (result) {
        NSAssert(result.numberOfRanges == _keys.count + 1, @"Number of regex groups must match number of path keys.");
        NSMutableDictionary *matches = [NSMutableDictionary dictionary];
        [_keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
            NSRange range = [result rangeAtIndex:idx + 1];
            [matches setObject:[trimmedPath substringWithRange:range] forKey:key];
        }];
        return matches;
    } else {
        return nil;
    }
}

- (NSRegularExpression *)regex {
    if (!_regex) {
        NSString *escapedPath = [NSRegularExpression escapedPatternForString:_path];
        NSMutableString *pattern = [NSMutableString stringWithFormat:@"^%@$", escapedPath];
        
        [_keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
            NSString *find = [@":" stringByAppendingString:key];
            NSString *replace = @"([^/]+)";
            [pattern replaceOccurrencesOfString:find withString:replace options:0 range:NSMakeRange(0, pattern.length)];
        }];
        _regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    }
    return _regex;
}

- (void)parsePath {
    NSAssert([self.path hasPrefix:@"/"], @"Path must be absolute.");
    NSArray *components = [[self.path substringFromIndex:1] pathComponents];
    
    NSMutableArray *keys = [NSMutableArray array];
    [components enumerateObjectsUsingBlock:^(NSString *component, NSUInteger idx, BOOL *stop) {
        if ([component hasPrefix:@":"]) {
            NSString *key = [component substringFromIndex:1];
            NSAssert(key.length > 0, @": must be followed by at least one character.");
            [keys addObject:key];
        }
    }];
    _keys = keys;
}
@end
