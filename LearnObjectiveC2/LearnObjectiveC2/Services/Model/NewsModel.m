//
//  NewsModel.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 29/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

- (instancetype)initFromDictionary:(NSDictionary*)dictionary {
    self = [super init];
    
    if (self) {
        self.author = [dictionary valueForKey:@"author"];
        self.category = [dictionary valueForKey:@"category"];
        self.newsDescription = [dictionary valueForKey:@"description"];
        self.newsId = [dictionary valueForKey:@"newsId"];
        self.image = [dictionary valueForKey:@"image"];
        self.language = [dictionary valueForKey:@"language"];
        self.published = [dictionary valueForKey:@"published"];
        self.title = [dictionary valueForKey:@"title"];
        self.url = [dictionary valueForKey:@"url"];
    }
    
    return self;
}

@end
