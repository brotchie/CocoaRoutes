//
//  CRBlockController.h
//  CocoaRoutes
//
//  Created by James Brotchie on 5/01/13.
//
//

#import <Foundation/Foundation.h>

@protocol CRController;
@class HTTPMessage;

typedef NSString *(^CRControllerBlock)(HTTPMessage * message, NSDictionary *args);

@interface CRBlockController : NSObject <CRController>
- (id)initWithGet:(CRControllerBlock)get post:(CRControllerBlock)post;

+ (CRBlockController *)get:(CRControllerBlock)get;
+ (CRBlockController *)post:(CRControllerBlock)post;
+ (CRBlockController *)get:(CRControllerBlock)get post:(CRControllerBlock)post;

@end
