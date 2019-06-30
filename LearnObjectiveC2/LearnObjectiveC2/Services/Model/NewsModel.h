//
//  NewsModel.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 29/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSArray *category;
@property (nonatomic, strong) NSString *newsDescription;
@property (nonatomic, strong) NSString *newsId;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *published;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;

- (instancetype)initFromDictionary:(NSDictionary*)dictionary;

@end
