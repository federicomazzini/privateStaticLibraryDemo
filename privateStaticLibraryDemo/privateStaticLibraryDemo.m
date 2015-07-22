//
//  privateStaticLibraryDemo.m
//  privateStaticLibraryDemo
//
//  Created by Federico Mazzini on 7/21/15.
//  Copyright (c) 2015 Globant. All rights reserved.
//

#import "privateStaticLibraryDemo.h"

@implementation privateStaticLibraryDemo

- (void)getGithubReposForUser:(NSString*)user withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"https://api.github.com/users/%@/repos", user] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
