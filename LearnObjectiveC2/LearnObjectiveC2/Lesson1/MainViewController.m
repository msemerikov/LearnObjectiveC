//
//  MainViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 24/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "MainViewController.h"
#import "AnotherViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIProgressView *progress;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIView *yellowView = [[UIView alloc] initWithFrame: CGRectMake(0.045*width, 0.045*height, 0.91*width, 0.91*height)];
    yellowView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: yellowView];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.05*width, 0.065*height, 0.9*width, 0.1*height)];
    [self.label setText:@"Lesson 1!"];
    [self.label setTextColor:[UIColor darkGrayColor]];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold]];
    [self.view addSubview:self.label];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0.05*width, 0.175*height, 0.9*width, 0.1*height)];
    [self.textField setBorderStyle:UITextBorderStyleLine];
    [self.textField setPlaceholder:@"Введите текст"];
    [self.view addSubview:self.textField];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0.05*width, 0.295*height, 0.9*width, 0.1*height)];
    [textView setBackgroundColor:[UIColor blackColor]];
    [textView setTextColor:[UIColor whiteColor]];
    [textView setFont:[UIFont systemFontOfSize:20]];
    [textView setText:@"Выполнение практического задания к первому уроку курса Разработка под iOS на Objective-C!"];
    [self.view addSubview:textView];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Первый", @"Второй", @"Третий"]];
    [segmentedControl setFrame:CGRectMake(0.05*width, 0.405*height, 0.9*width, 0.1*height)];
    [segmentedControl setTintColor:[UIColor blueColor]];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0.05*width, 0.515*height, 0.9*width, 0.1*height)];
    [slider setValue:0.5];
    [slider addTarget:self action:@selector(changeSliderValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    self.progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progress setTintColor:[UIColor redColor]];
    [self.progress setFrame:CGRectMake(0.05*width, 0.625*height, 0.9*width, 0.1*height)];
    [self.progress setProgress:0.5];
    [self.view addSubview:self.progress];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.05*width, 0.735*height, 0.9*width, 0.1*height)];
    [imgView setImage:[UIImage imageNamed:@"image"]];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.05*width, 0.845*height, 0.9*width, 0.1*height)];
    [button setTitle:@"На следующий экран" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(width/2 - 15, height/2 - 15, 30, 30)];
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.indicator setColor:[UIColor blackColor]];
    [self.indicator setHidesWhenStopped:true];
    [self.view addSubview:self.indicator];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES];
}

- (void)buttonPressed {
    AnotherViewController *anotherViewController = [[AnotherViewController alloc] init];
    
    [self.navigationController showViewController:anotherViewController sender:self];

    [self.indicator startAnimating];
}

- (void)changeSegment:(UISegmentedControl*)sender {
    NSLog(@"Выбран сегмент номер %li", (long)[sender selectedSegmentIndex]+1);
}

- (void)changeSliderValue:(UISlider*)sender {
    [self.label setText:[NSString stringWithFormat:@"%f", sender.value]];
    [self.progress setProgress:sender.value];
}

@end
