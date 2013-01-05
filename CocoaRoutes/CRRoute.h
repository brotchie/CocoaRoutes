//
//  CRRoute.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <Foundation/Foundation.h>

@protocol CRController;
@class CRController;

@interface CRRoute : NSObject
@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) NSString *path;
@property (readonly, nonatomic) id<CRController> controller;

- (id)initWithName:(NSString *)name path:(NSString *)path controller:(id<CRController>)controller;
- (NSDictionary *)match:(NSString *)requestPath;

@end
