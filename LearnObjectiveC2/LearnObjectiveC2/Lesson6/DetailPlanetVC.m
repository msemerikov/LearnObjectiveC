//
//  DetailPlanetVC.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "DetailPlanetVC.h"

@interface DetailPlanetVC ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *planetImage;

@end

@implementation DetailPlanetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 88, width, 50)];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold]];
    [self.nameLabel setText:self.planet.name];
    [self.view addSubview:self.nameLabel];
    
    self.planetImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 138, width, width)];
    [self.planetImage setImage:[UIImage imageNamed:self.planet.name]];
    [self.planetImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.planetImage];
    
    UILabel *headerPC = [[UILabel alloc] initWithFrame:CGRectMake(0, 138 + width, width, 30)];
    [headerPC setTextAlignment:NSTextAlignmentCenter];
    [headerPC setFont:[UIFont systemFontOfSize:19 weight:UIFontWeightSemibold]];
    [headerPC setText:@"Physical characteristics"];
    [self.view addSubview:headerPC];
    
    UILabel *radiusHeader = [[UILabel alloc] initWithFrame:CGRectMake(5, 168 + width, 0.6*width - 10, 30)];
    [radiusHeader setText:@"Radius"];
    [self.view addSubview:radiusHeader];
    
    UILabel *radiusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.6*width, 168 + width, 0.2*width, 30)];
    [radiusLabel setTextAlignment:NSTextAlignmentRight];
    [radiusLabel setText:[[NSNumber numberWithDouble:self.planet.radius] stringValue]];
    [self.view addSubview:radiusLabel];
    
    UILabel *radiusFooter = [[UILabel alloc] initWithFrame:CGRectMake(0.8*width, 168 + width, 0.2*width, 30)];
    [radiusFooter setTextAlignment:NSTextAlignmentLeft];
    [radiusFooter setText:@" km"];
    [self.view addSubview:radiusFooter];
    
    UILabel *surfaceAreaHeader = [[UILabel alloc] initWithFrame:CGRectMake(5, 198 + width, 0.6*width - 10, 30)];
    [surfaceAreaHeader setText:@"Surface area"];
    [self.view addSubview:surfaceAreaHeader];
    
    UILabel *surfaceAreaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.6*width, 198 + width, 0.2*width, 30)];
    [surfaceAreaLabel setTextAlignment:NSTextAlignmentRight];
    [surfaceAreaLabel setText:[[NSNumber numberWithDouble:self.planet.surfaceArea] stringValue]];
    [self.view addSubview:surfaceAreaLabel];
    
    UILabel *surfaceAreaFooter = [[UILabel alloc] initWithFrame:CGRectMake(0.8*width, 198 + width, 0.2*width, 30)];
    [surfaceAreaFooter setTextAlignment:NSTextAlignmentLeft];
    [surfaceAreaFooter setText:@" km\u00b2"];
    [self.view addSubview:surfaceAreaFooter];
    
    UILabel *volumeHeader = [[UILabel alloc] initWithFrame:CGRectMake(5, 228 + width, 0.6*width - 10, 30)];
    [volumeHeader setText:@"Volume"];
    [self.view addSubview:volumeHeader];
    
    UILabel *volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.6*width, 228 + width, 0.2*width, 30)];
    [volumeLabel setTextAlignment:NSTextAlignmentRight];
    [volumeLabel setText:[[NSNumber numberWithDouble:self.planet.volume] stringValue]];
    [self.view addSubview:volumeLabel];
    
    UILabel *volumeFooter = [[UILabel alloc] initWithFrame:CGRectMake(0.8*width, 228 + width, 0.2*width, 30)];
    [volumeFooter setTextAlignment:NSTextAlignmentLeft];
    [volumeFooter setText:@" km\u00b3"];
    [self.view addSubview:volumeFooter];
    
    UILabel *massHeader = [[UILabel alloc] initWithFrame:CGRectMake(5, 258 + width, 0.6*width - 10, 30)];
    [massHeader setText:@"Mass"];
    [self.view addSubview:massHeader];
    
    UILabel *massLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.6*width, 258 + width, 0.2*width, 30)];
    [massLabel setTextAlignment:NSTextAlignmentRight];
    [massLabel setText:[[NSNumber numberWithDouble:self.planet.mass] stringValue]];
    [self.view addSubview:massLabel];
    
    UILabel *massFooter = [[UILabel alloc] initWithFrame:CGRectMake(0.8*width, 258 + width, 0.2*width, 30)];
    [massFooter setTextAlignment:NSTextAlignmentLeft];
    [massFooter setText:@" kg"];
    [self.view addSubview:massFooter];
    
}

@end
