//
//  CreatePlanetViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "CreatePlanetViewController.h"

@interface CreatePlanetViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *radiusField;
@property (nonatomic, strong) UITextField *surfaceAreaField;
@property (nonatomic, strong) UITextField *volumeField;
@property (nonatomic, strong) UITextField *massField;

@end

@implementation CreatePlanetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 88, width - 10, 50)];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    [nameLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightBold]];
    [nameLabel setText:@"Planet name"];
    [self.view addSubview:nameLabel];
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 138, width, 50)];
    [self.nameField setPlaceholder:@"Example: Jupiter"];
    [self.nameField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.nameField];
    
    UILabel *radiusLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 188, width - 10, 50)];
    [radiusLabel setTextAlignment:NSTextAlignmentLeft];
    [radiusLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightBold]];
    [radiusLabel setText:@"Radius"];
    [self.view addSubview:radiusLabel];
    
    self.radiusField = [[UITextField alloc] initWithFrame:CGRectMake(0, 238, width, 50)];
    [self.radiusField setPlaceholder:@"Example: 69911 km"];
    [self.radiusField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.radiusField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [self.view addSubview:self.radiusField];
    
    UILabel *surfaceAreaLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 288, width - 10, 50)];
    [surfaceAreaLabel setTextAlignment:NSTextAlignmentLeft];
    [surfaceAreaLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightBold]];
    [surfaceAreaLabel setText:@"Surface area"];
    [self.view addSubview:surfaceAreaLabel];
    
    self.surfaceAreaField = [[UITextField alloc] initWithFrame:CGRectMake(0, 338, width, 50)];
    [self.surfaceAreaField setPlaceholder:@"Example: 61.419×10\u2079 km\u00b2"];
    [self.surfaceAreaField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.surfaceAreaField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.surfaceAreaField];
    
    UILabel *volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 388, width - 10, 50)];
    [volumeLabel setTextAlignment:NSTextAlignmentLeft];
    [volumeLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightBold]];
    [volumeLabel setText:@"Volume"];
    [self.view addSubview:volumeLabel];
    
    self.volumeField = [[UITextField alloc] initWithFrame:CGRectMake(0, 438, width, 50)];
    [self.volumeField setPlaceholder:@"Example: 1.4313×10\u00b9\u2075 km\u00b3"];
    [self.volumeField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.volumeField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.volumeField];
    
    UILabel *massLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 488, width - 10, 50)];
    [massLabel setTextAlignment:NSTextAlignmentLeft];
    [massLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightBold]];
    [massLabel setText:@"Mass"];
    [self.view addSubview:massLabel];
    
    self.massField = [[UITextField alloc] initWithFrame:CGRectMake(0, 538, width, 50)];
    [self.massField setPlaceholder:@"Example: 1.8982×10\u00b2\u2077 kg"];
    [self.massField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.massField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:self.massField];
    
    UIBarButtonItem *saveButtton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonTap)];
    [self.navigationItem setRightBarButtonItem:saveButtton];
}

- (void)saveButtonTap {
    double radius = [self.radiusField.text doubleValue];
    double surfaceArea = [self.surfaceAreaField.text doubleValue];
    double volume = [self.volumeField.text doubleValue];
    double mass = [self.massField.text doubleValue];
    [[CoreDataService sharedInstance] createPlanetWithName:self.nameField.text
                                                withRadius:[NSNumber numberWithDouble:radius] withSurfaceArea:[NSNumber numberWithDouble:surfaceArea] withVolume:[NSNumber numberWithDouble:volume] withMass:[NSNumber numberWithDouble:mass]];
    [self.navigationController popViewControllerAnimated:true];
}

@end
