//
//  NewsDetail.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 30/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "NewsDetail.h"

@interface NewsDetail ()

@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImage *newsImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) NewsModel *model;

@end

@implementation NewsDetail

- (instancetype)initWithModel:(NewsModel*)model {
    self = [super init];
    
    if (self) {
        [self setModel:model];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollview.contentSize = self.view.bounds.size;
    
    [self.view addSubview:scrollview];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, width - 10, 100)];

    [self.titleLabel setFont:[UIFont systemFontOfSize:30 weight:UIFontWeightBold]];
    [self.titleLabel setNumberOfLines:20];
    [self.titleLabel setText:self.model.title];
    [scrollview addSubview:self.titleLabel];
    
    NSString *content = self.model.newsDescription;
    CGSize maximumLabelSize = CGSizeMake(width - 10, 9999);
    NSDictionary *stringAttributes = [NSDictionary dictionaryWithObject:[UIFont fontWithName:@"American Typewriter" size:17] forKey: NSFontAttributeName];
    CGSize expectedLabelSize = [content boundingRectWithSize:maximumLabelSize options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:stringAttributes context:nil].size;
    
    CGFloat labelHeight = expectedLabelSize.height;
    
    if (![_model.image isEqual: @"None"]) {
    
        NSLog(@"%@", _model.image);
        UIImageView *imgView = [[UIImageView alloc] init];
        NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.image]];
        imgView.image=[UIImage imageWithData:data];
        CGFloat imgHeight =(width - 10) * imgView.image.size.height / imgView.image.size.width;
        [imgView setFrame:CGRectMake(5, 120, width - 10, imgHeight)];
        [imgView setContentMode:UIViewContentModeScaleAspectFit];
        [scrollview addSubview:imgView];
        
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 130 + imgHeight, width - 10, labelHeight)];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 140+imgHeight+labelHeight, width - 10, 20)];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 170+imgHeight+labelHeight, width - 10, 20)];
    
    } else {
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 120, width - 10, labelHeight)];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 130+labelHeight, width - 10, 20)];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 160+labelHeight, width - 10, 20)];
    }
    
    [self.descriptionLabel setText:content];
    [self.descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.descriptionLabel setNumberOfLines:0];
    [scrollview addSubview:self.descriptionLabel];
    
    [self.authorLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [self.authorLabel setText:self.model.author];
    [scrollview addSubview:self.authorLabel];
    
    [self.dateLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [self.dateLabel setText:self.model.published];
    [scrollview addSubview:self.dateLabel];
    
}

@end
