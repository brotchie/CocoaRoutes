//
//  CRMapper.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <Foundation/Foundation.h>

@protocol CRController;
@class CRRoute;
@class HTTPMessage;

@interface CRMapper : NSObject
- (NSArray *)routes;

- (CRRoute *)connect:(NSString *)path controller:(id<CRController>)controller;
- (CRRoute *)connect:(NSString *)name path:(NSString *)path controller:(id<CRController>)controller;
- (NSString *)dispatch:(HTTPMessage *)message method:(NSString *)method URI:(NSString *)path;
@end
