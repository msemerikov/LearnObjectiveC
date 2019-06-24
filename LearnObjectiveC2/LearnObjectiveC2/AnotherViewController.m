//
//  AnotherViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 24/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO];
    
    self.view.backgroundColor = [UIColor redColor];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
