//
//  CRController.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <Foundation/Foundation.h>

@class HTTPMessage;

@protocol CRController <NSObject>
@optional
- (NSString *)get:(HTTPMessage *)message args:(NSDictionary *)args;
- (NSString *)post:(HTTPMessage *)message args:(NSDictionary *)args;
@end
