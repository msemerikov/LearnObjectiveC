//
//  SatelliteTableViewController.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 25/06/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "SatelliteTableViewController.h"

@interface SatelliteTableViewController ()

@property (nonatomic, strong) NSMutableDictionary *satellites;

@end

@implementation SatelliteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *satEarth = [NSArray arrayWithObjects:@"Moon", nil];
    NSArray *satMars = [NSArray arrayWithObjects:@"Phobos", @"Deimos", nil];
    NSArray *satJupiter = [NSArray arrayWithObjects:@"Metis", @"Adrastea", @"Amalthea", @"Thebe", @"Io", @"Europa", @"Ganymede", @"Callisto", @"Themisto", @"Leda", @"Himalia", @"S/2018 J 1", @"S/2017 J 4", @"Lysithea", @"Elara", @"Dia", @"Carpo", @"S/2003 J 12", @"Valetudo", @"Euporie", @"S/2003 J 3", @"S/2003 J 18", @"S/2010 J 2", @"Thelxinoe", @"Euanthe", @"Helike", @"Orthosie", @"S/2017 J 7", @"S/2016 J 1", @"S/2017 J 3", @"Iocaste", @"S/2003 J 16", @"Praxidike", @"Harpalyke", @"Mneme", @"Hermippe", @"Thyone", @"S/2017 J 9", @"Ananke", @"Herse", @"Aitne", @"S/2017 J 6", @"S/2011 J 1", @"Kale", @"Taygete", @"S/2003 J 19", @"Chaldene", @"S/2003 J 15", @"S/2003 J 10", @"S/2003 J 23", @"Erinome", @"Aoede", @"Kallichore", @"S/2017 J 5", @"S/2017 J 8", @"Kalyke", @"Carme", @"Callirrhoe", @"Eurydome", @"S/2017 J 2", @"Pasithee", @"S/2010 J 1", @"Kore", @"Cyllene", @"S/2011 J 2", @"Eukelade", @"S/2017 J 1", @"S/2003 J 4", @"Pasiphae", @"Hegemone", @"Arche", @"Isonoe", @"S/2003 J 9", @"S/2003 J 5", @"Sinope", @"Sponde", @"Autonoe", @"Megaclite", @"S/2003 J 2", nil];
    NSArray *satSaturn = [NSArray arrayWithObjects:@"S/2009 S 1", @"Pan", @"Daphnis", @"Atlas", @"Prometheus", @"Pandora", @"Epimetheus", @"Janus", @"Aegaeon", @"Mimas", @"Methone", @"Anthe", @"Pallene", @"Enceladus", @"Tethys", @"Telesto", @"Calypso", @"Dione", @"Helene", @"Polydeuces", @"Rhea", @"Titan", @"Hyperion", @"Iapetus", @"Kiviuq", @"Ijiraq", @"Phoebe", @"Paaliaq", @"Skathi", @"Albiorix", @"S/2007 S 2", @"Bebhionn", @"Erriapus", @"Skoll", @"Siarnaq", @"Tarqeq", @"S/2004 S 13", @"Greip", @"Hyrrokkin", @"Jarnsaxa", @"Tarvos", @"Mundilfari", @"S/2006 S 1", @"S/2004 S 17", @"Bergelmir", @"Narvi", @"Suttungr", @"Hati", @"S/2004 S 12", @"Farbauti", @"Thrymr", @"Aegir", @"S/2007 S 3", @"Bestla", @"S/2004 S 7", @"S/2006 S 3", @"Fenrir", @"Surtur", @"Kari", @"Ymir", @"Loge", @"Fornjot", nil];
    NSArray *satUranus = [NSArray arrayWithObjects:@"Cordelia", @"Ophelia", @"Bianca", @"Cressida", @"Desdemona", @"Juliet", @"Portia", @"Rosalind", @"Cupid", @"Belinda", @"Perdita", @"Puck", @"Mab", @"Miranda", @"Ariel", @"Umbriel", @"Titania", @"Oberon", @"Francisco", @"Caliban", @"Stephano", @"Trinculo", @"Sycorax", @"Margaret", @"Prospero", @"Setebos", @"Ferdinand", nil];
    NSArray *satNeptune = [NSArray arrayWithObjects:@"Naiad", @"Thalassa", @"Despina", @"Galatea", @"Larissa", @"Hippocamp", @"Proteus", @"Triton", @"Nereid", @"Halimede", @"Sao", @"Laomedeia", @"Psamathe", @"Neso", nil];
    NSArray *satPluto = [NSArray arrayWithObjects:@"Charon", @"Styx", @"Nix", @"Kerberos", @"Hydra", nil];
    
    self.satellites = [NSMutableDictionary new];
    [self.satellites setObject:satEarth forKey:@"Earth"];
    [self.satellites setObject:satMars forKey:@"Mars"];
    [self.satellites setObject:satJupiter forKey:@"Jupiter"];
    [self.satellites setObject:satSaturn forKey:@"Saturn"];
    [self.satellites setObject:satUranus forKey:@"Uranus"];
    [self.satellites setObject:satNeptune forKey:@"Neptune"];
    [self.satellites setObject:satPluto forKey:@"Pluto"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setRowHeight:50];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setTableFooterView:[UIView alloc]];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sat = _satellites[_spaceBody];
    return sat.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sat = _satellites[_spaceBody];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [sat objectAtIndex:indexPath.row];
    return cell;
}

@end
