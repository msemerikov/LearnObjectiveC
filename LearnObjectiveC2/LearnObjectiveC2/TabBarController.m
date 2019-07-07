//
//  TabBarController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 07/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        MainViewController *first = [[MainViewController alloc] init];
        first.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lesson 1" image:nil tag:0];
        AnotherViewController *second = [[AnotherViewController alloc] init];
        second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lesson 2" image:nil tag:1];
        NewsListTableViewController *third = [[NewsListTableViewController alloc] init];
        third.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lesson 3" image:nil tag:2];
        MapViewController *fourth = [[MapViewController alloc] init];
        fourth.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lesson 4" image:nil tag:3];
        CollectionViewController *fifth = [[CollectionViewController alloc] init];
        fifth.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lesson 5" image:nil tag:4];
        
        self.viewControllers = @[first, second, third, fourth, fifth];
        [self.tabBar setTintColor:[UIColor blueColor]];
        [self setSelectedIndex:0];
    }
    return self;
}

@end
