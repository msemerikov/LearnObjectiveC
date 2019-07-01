//
//  NetworkService.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 29/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "NetworkService.h"

#define MAIN_URL @"https://api.currentsapi.services/v1/search?type=1&language=en"

@implementation NetworkService

+ (instancetype)sharedInstance {
    static NetworkService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkService alloc] init];
    });
    return instance;
}

- (void)getAllNews:(void (^)(NSArray *news))completion {
    [self load:MAIN_URL withCompletion:^(id  _Nullable result) {
        NSDictionary *dict = result;
        NSArray *arr = dict[@"news"];
        NSMutableArray *resultObjects = [NSMutableArray new];
        for (NSDictionary *oneNews in arr) {
            NewsModel *model = [[NewsModel alloc] init];
            model.author = oneNews[@"author"];
            model.newsDescription = oneNews[@"description"];
            model.newsId = oneNews[@"id"];
            model.image = oneNews[@"image"];
            model.language = oneNews[@"language"];
            model.published = oneNews[@"published"];
            model.title = oneNews[@"title"];
            model.url = oneNews[@"url"];
            [resultObjects addObject:model];
        }
        completion(resultObjects);
    }];
}

- (void)load:(NSString*)address withCompletion:(void (^)(id _Nullable result))completion {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:address]];
    [request setValue:@"obySQQwfKFHEQ4uOEp0JbaKWGDMY3xGZBxj-vMJHV0pXklAg"
   forHTTPHeaderField:@"Authorization"];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil]);
    }] resume];
}

@end
