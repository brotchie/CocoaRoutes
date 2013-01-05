//
//  NSString+CocoaRoutes.m
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "NSString+CocoaRoutes.h"

@implementation NSString (CocoaRoutes)
- (NSString *)stringByTrimmingTrailingSlash {
    if ([self hasSuffix:@"/"]) {
        return [self substringToIndex:self.length - 1];
    } else {
        return self;
    }
}
@end
