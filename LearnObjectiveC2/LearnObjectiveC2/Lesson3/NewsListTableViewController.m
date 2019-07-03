//
//  NewsListTableViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 29/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "NewsListTableViewController.h"

@interface NewsListTableViewController ()

@property (nonatomic, strong) NSMutableArray *news;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation NewsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = self.refreshControl;
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.indicator setColor:[UIColor blackColor]];
    [self.indicator startAnimating];
    [self.indicator setHidesWhenStopped:true];
    [self.view addSubview:self.indicator];
    
    [self setTitle:@"News"];
    [self.navigationController.navigationBar setPrefersLargeTitles:true];
    
    self.news = [NSMutableArray new];
    
    [[NetworkService sharedInstance] getAllNews:^(NSArray *news) {
        [self.news addObjectsFromArray:news];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.indicator stopAnimating];
        });
    }];
}

- (void)refresh
{
    
    [[NetworkService sharedInstance] getAllNews:^(NSArray *news) {
        [self.news addObjectsFromArray:news];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.refreshControl endRefreshing];
            [self.tableView reloadData];
        });
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    NewsModel *model = [self.news objectAtIndex:indexPath.row];
    
//    NSString *pokemonName = [model pokemonName];
//    pokemonName = [pokemonName stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[pokemonName substringToIndex:1] uppercaseString]];
    
    cell.textLabel.text = [model title];
    cell.detailTextLabel.text = [model published];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.indicator startAnimating];
    NewsModel *model = [self.news objectAtIndex:indexPath.row];
    NewsDetail *vc = [[NewsDetail alloc] initWithModel:model];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.indicator stopAnimating];
        [self.navigationController pushViewController:vc animated:true];
    });
    
}

@end
