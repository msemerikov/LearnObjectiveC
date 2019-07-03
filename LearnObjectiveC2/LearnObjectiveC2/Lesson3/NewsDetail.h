//
//  NewsDetail.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 30/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsDetail : UIViewController

- (instancetype)initWithModel:(NewsModel*)model;

@end
