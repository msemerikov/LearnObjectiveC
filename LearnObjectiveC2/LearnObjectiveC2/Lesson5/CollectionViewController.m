//
//  CollectionViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 07/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIImageView *spaceBodyImage;
@property (nonatomic, strong) UILabel *spaceBodyLabel;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.searchArray = [[NSMutableArray alloc] init];
    
    NSArray *spaceBodies = [NSMutableArray arrayWithObjects:@"Sun", @"Mercury", @"Venus", @"Earth", @"Moon", @"Mars", @"Jupiter", @"Saturn", @"Uranus", @"Neptune", @"Pluto", nil];
    
    for (int i = 0; i < spaceBodies.count; i++) {
        CollectionModel *model = [[CollectionModel alloc] init];
        model.imageName = spaceBodies[i];
        [self.dataArray addObject:model];
    }
    
    //    self.searchController = [[UISearchController alloc] init];
    //    self.searchController.dimsBackgroundDuringPresentation = false;
    //    [self.searchController setSearchResultsUpdater:self];
    //    [self.navigationItem setSearchController:self.searchController];
    //    [self.searchController.searchBar sizeToFit];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width / 2 - 5, self.view.bounds.size.width / 2 - 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.collectionView setContentInset:UIEdgeInsetsMake(44, 0, 0, 0)];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView setDataSource:self];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.view addSubview:self.collectionView];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, self.collectionView.frame.size.width, 44)];
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.delegate = self;
    [self.collectionView addSubview:self.searchBar];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.searchArray count] > 0) {
        return [self.searchArray count];
    }
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    CollectionModel *model = nil;//[[CollectionModel alloc] init];
    
    if ([self.searchArray count] > 0) {
        model = self.searchArray[indexPath.item];
    } else {
        model = self.dataArray[indexPath.item];
    }
    
    self.spaceBodyImage = [[UIImageView alloc] init];
    [self.spaceBodyImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.spaceBodyImage setBackgroundColor:[UIColor whiteColor]];
    [self.spaceBodyImage setImage:[UIImage imageNamed:model.imageName]];
    [self.spaceBodyImage setFrame:CGRectMake(18.5, 2, self.view.bounds.size.width / 2 - 42, self.view.bounds.size.width / 2 - 42)];
    [cell.contentView addSubview:self.spaceBodyImage];
    
    self.spaceBodyLabel = [[UILabel alloc] init];
    [self.spaceBodyLabel setTextAlignment:NSTextAlignmentCenter];
    [self.spaceBodyLabel setBackgroundColor:[UIColor whiteColor]];
    [self.spaceBodyLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightRegular]];
    [self.spaceBodyLabel setText:model.imageName];
    [self.spaceBodyLabel setFrame:CGRectMake(2, self.view.bounds.size.width / 2 - 38, self.view.bounds.size.width / 2 - 9, 30)];
    [cell.contentView addSubview:self.spaceBodyLabel];
    
    return cell;
}

#pragma mark <SearchBar>

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.imageName CONTAINS[cd]%@", searchBar.text];
//    self.searchArray = [self.dataArray filteredArrayUsingPredicate:predicate];
//    [self.collectionView reloadData];
//}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar setText:@""];
    [searchBar setShowsCancelButton:NO animated:YES];
    self.searchArray = nil;
    [self.collectionView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.imageName CONTAINS[cd]%@", searchBar.text];
    self.searchArray = [self.dataArray filteredArrayUsingPredicate:predicate];
    [self.collectionView reloadData];
}

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.imageName CONTAINS[cd]%@", searchController.searchBar.text];
        self.searchArray = [self.dataArray filteredArrayUsingPredicate:predicate];
        [self.collectionView reloadData];
    }
}

@end
