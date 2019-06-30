//
//  NetworkService.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 29/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"

@interface NetworkService : NSObject

+ (instancetype)sharedInstance;

- (void)getAllNews:(void (^)(NSArray *news))completion;

@end
