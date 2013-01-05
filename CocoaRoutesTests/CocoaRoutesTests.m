//
//  CocoaRoutesTests.m
//  CocoaRoutesTests
//
//  Created by James Brotchie on 5/01/13.
//
//

#import "CocoaRoutesTests.h"
#import "CocoaRoutes.h"

@implementation CocoaRoutesTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testRoutePathMatching
{
    CRRoute *route = [[CRRoute alloc] initWithName:nil path:@"/company/:company/person/:name" controller:nil];
    NSDictionary *result = [route match:@"/company/apple/person/steve"];
    STAssertNotNil(result, @"'/company/apple/person/steve should' match");
    STAssertEqualObjects(result[@"company"], @"apple", @":company should be apple.");
    STAssertEqualObjects(result[@"name"], @"steve", @":name should be steve.");
}

@end
