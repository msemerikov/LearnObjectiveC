//
//  CoreDataService.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Planets+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataService : NSObject

+ (instancetype)sharedInstance;

- (void)createPlanetWithName:(NSString*)name withRadius:(NSNumber*)radius withSurfaceArea:(NSNumber*)surfaceArea withVolume:(NSNumber*)volume withMass:(NSNumber*)mass;
- (NSArray*)getAllPlanets;
- (void)deleteByName:(NSString*)name;

@end


NS_ASSUME_NONNULL_END
