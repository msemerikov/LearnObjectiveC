//
//  SpaceCell.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 25/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "SpaceCell.h"

@interface SpaceCell ()

@property (nonatomic, strong) UIImageView *spaceBodyImage;
@property (nonatomic, strong) UILabel *spaceBodyLabel;
@property (nonatomic, strong) UILabel *satellitesCount;

@end

@implementation SpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.spaceBodyImage = [[UIImageView alloc] initWithFrame:CGRectMake(16, 5, 40, 40)];
        [self.spaceBodyImage setContentMode:UIViewContentModeScaleAspectFill];
        [self.spaceBodyImage setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.spaceBodyImage];
        
        self.spaceBodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(74, 5, 120, 40)];
        [self.spaceBodyLabel setTextAlignment:NSTextAlignmentLeft];
        [self.spaceBodyLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightRegular]];
        [self.contentView addSubview:self.spaceBodyLabel];
        
        self.satellitesCount = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 25, 5, 25, 40)];
        [self.satellitesCount setTextAlignment:NSTextAlignmentRight];
        [self.satellitesCount setTextColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:self.satellitesCount];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupCell:(NSString *)name {
    NSDictionary *satellitesCount = @{
                                      @"Sun" : @"",
                                      @"Mercury" : @"0",
                                      @"Venus" : @"0",
                                      @"Earth" : @"1",
                                      @"Moon" : @"",
                                      @"Mars" : @"2",
                                      @"Jupiter" : @"79",
                                      @"Saturn" : @"62",
                                      @"Uranus" : @"27",
                                      @"Neptune" : @"14",
                                      @"Pluto" : @"5"
                                      };
    
    [self.spaceBodyImage setImage:[UIImage imageNamed:name]];
    [self.spaceBodyLabel setText:name];
    [self.satellitesCount setText:satellitesCount[name]];
}

@end
