//
//  privateStaticLibraryDemo.h
//  privateStaticLibraryDemo
//
//  Created by Federico Mazzini on 7/21/15.
//  Copyright (c) 2015 Globant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface privateStaticLibraryDemo : NSObject

- (void)getGithubReposForUser:(NSString*)user withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
