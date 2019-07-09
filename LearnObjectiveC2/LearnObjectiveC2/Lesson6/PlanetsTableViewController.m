//
//  PlanetsTableViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "PlanetsTableViewController.h"

@interface PlanetsTableViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *planets;
@property (nonatomic, strong) NSArray *searchPlanets;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation PlanetsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButtton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(addButtonTap)];
    [self.navigationItem setRightBarButtonItem:addButtton];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.dimsBackgroundDuringPresentation = false;
    [self.searchController setSearchResultsUpdater:self];
    [self.navigationItem setSearchController:self.searchController];
    
    [self update];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(update) name:NSManagedObjectContextDidSaveNotification object:nil];
}

- (void)addButtonTap {
    CreatePlanetViewController *vc = [[CreatePlanetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)update {
    self.planets = [[CoreDataService sharedInstance] getAllPlanets];
    [self.tableView reloadData];
}

#pragma mark - ResultsUpdater -

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd]%@", searchController.searchBar.text];
        self.searchPlanets = [self.planets filteredArrayUsingPredicate:predicate];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.isActive && [self.searchPlanets count] > 0) {
        return [self.searchPlanets count];
    }
    return [self.planets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    Planets *planet = nil;//[self.planets objectAtIndex:indexPath.row];
    
    if (self.searchController.isActive && [self.searchPlanets count] > 0) {
        planet = [self.searchPlanets objectAtIndex:indexPath.row];
    } else {
        planet = [self.planets objectAtIndex:indexPath.row];
    }
    
    [cell.textLabel setText:planet.name];
    return cell;
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Planets *planet = [self.planets objectAtIndex:indexPath.row];
    [[CoreDataService sharedInstance] deleteByName:planet.name];
    [self update];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailPlanetVC *detailPlanetVC = [[DetailPlanetVC alloc] init];
    detailPlanetVC.planet = _planets[indexPath.row];
    [[detailPlanetVC navigationController] setNavigationBarHidden:NO];
    [detailPlanetVC.navigationController.navigationBar setPrefersLargeTitles:YES];
    [self.navigationController pushViewController:detailPlanetVC animated:YES];
}

@end
