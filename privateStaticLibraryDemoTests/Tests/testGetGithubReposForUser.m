//
//  testGetGithubReposForUser.m
//  privateStaticLibraryDemo
//
//  Created by Federico Mazzini on 7/22/15.
//  Copyright (c) 2015 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "privateStaticLibraryDemo.h"

NSString * const GITHUB_USERNAME = @"federicomazzini";

@interface testGetGithubReposForUser : XCTestCase

@end

@implementation testGetGithubReposForUser

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
//
//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

- (void)testGetReposForBurczyk
{
    __block id JSON;
    
    hxRunInMainLoop(^(BOOL *done) {
        privateStaticLibraryDemo *nl = [[privateStaticLibraryDemo alloc] init];
        [nl getGithubReposForUser:GITHUB_USERNAME withSuccess:^(id responseObject) {
            NSLog(@"Response: %@", responseObject);
            JSON = responseObject;
            *done = YES;
        } failure:^(NSError *error) {
            *done = YES;
        }];
    });
    
    XCTAssertNotNil(JSON, @"");
}

- (void)testGetRepoForNotExistingUser
{
    __block id JSON;
    
    NSString* notExistingUser = [[NSString alloc]init];
    notExistingUser = [GITHUB_USERNAME stringByAppendingString:@"1234567890zzz"];
    
    hxRunInMainLoop(^(BOOL *done) {
        privateStaticLibraryDemo *nl = [[privateStaticLibraryDemo alloc] init];
        [nl getGithubReposForUser:notExistingUser withSuccess:^(id responseObject) {
            NSLog(@"Response: %@", responseObject);
            JSON = responseObject;
            *done = YES;
        } failure:^(NSError *error) {
            *done = YES;
        }];
    });
    
    XCTAssertNil(JSON, @"");
}

// Wrapper to test async methods: http://stackoverflow.com/questions/2162213/how-to-unit-test-asynchronous-apis
static inline void hxRunInMainLoop(void(^block)(BOOL *done)) {
    __block BOOL done = NO;
    block(&done);
    while (!done) {
        [[NSRunLoop mainRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow:.1]];
    }
}

@end
