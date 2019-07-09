//
//  CoreDataService.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import "CoreDataService.h"
#import <CoreData/CoreData.h>

@interface CoreDataService ()

@property (nonatomic, strong) NSPersistentContainer *persistantContainer;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation CoreDataService

+ (instancetype)sharedInstance {
    static CoreDataService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataService alloc] init];
        [instance setup];
    });
    return instance;
}

- (void)setup {
    self.persistantContainer = [[NSPersistentContainer alloc] initWithName:@"PlanetDataModel"];
    [self.persistantContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *descroption, NSError * error) {
        if (error != nil) {
            NSLog(@"Core data init error");
            abort();
        }
        self.context = self.persistantContainer.viewContext;
    }];
}

- (void)createPlanetWithName:(NSString*)name withRadius:(NSNumber*)radius withSurfaceArea:(NSNumber*)surfaceArea withVolume:(NSNumber*)volume withMass:(NSNumber*)mass {
    Planets *newPlanet = [NSEntityDescription insertNewObjectForEntityForName:@"Planets" inManagedObjectContext:self.context];

    [newPlanet setValue:name forKey:@"name"];
    [newPlanet setValue:radius forKey:@"radius"];
    [newPlanet setValue:surfaceArea forKey:@"surfaceArea"];
    [newPlanet setValue:volume forKey:@"volume"];
    [newPlanet setValue:mass forKey:@"mass"];
    [self save];
}

- (NSArray*)getAllPlanets {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Planets"];
    NSError *error;
    
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    if (error && !results) {
        NSLog(@"Error fetching.");
    }
    
    return results;
}

- (void)deleteByName:(NSString*)name {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Planets"];
    request.predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    
    NSError *error;
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    if (error && !results) {
        NSLog(@"Error fetching Planets: %@", [error localizedDescription]);
    }
    
    Planets *objectToDelete = results.firstObject;
    [self.context deleteObject: objectToDelete];
    [self save];
}

- (void)save {
    NSError *error;
    if (![self.context save:&error]) {
        NSAssert(false, @"Error context save.");
    }
}

@end
