//
//  AnotherViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 24/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *spaceBodies;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.spaceBodies = [NSMutableArray new];
    [self.spaceBodies addObjectsFromArray:@[@"Sun", @"Mercury", @"Venus", @"Earth", @"Moon", @"Mars", @"Jupiter", @"Saturn", @"Uranus", @"Neptune", @"Pluto"]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.tableView registerClass:[SpaceCell class] forCellReuseIdentifier:@"SpaceCell"];
    
    self.tableView.rowHeight = 50;
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    [self.tableView setTableFooterView:[UIView alloc]];
    
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO];
    [self setTitle:@"Солнечная система"];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.spaceBodies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpaceCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SpaceCell"];
    [cell setupCell:[self.spaceBodies objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.spaceBodies removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SatelliteTableViewController *satvc = [[SatelliteTableViewController alloc] init];
    satvc.spaceBody = _spaceBodies[indexPath.row];
    NSString *planet = _spaceBodies[indexPath.row];
    [[satvc navigationController] setNavigationBarHidden:NO];
    [satvc setTitle:planet];
    [satvc.navigationController.navigationBar setPrefersLargeTitles:YES];
    [self.navigationController pushViewController:satvc animated:YES];
}

@end
