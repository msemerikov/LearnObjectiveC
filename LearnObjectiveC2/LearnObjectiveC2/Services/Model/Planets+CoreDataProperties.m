//
//  Planets+CoreDataProperties.m
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//
//

#import "Planets+CoreDataProperties.h"

@implementation Planets (CoreDataProperties)

+ (NSFetchRequest<Planets *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Planets"];
}

@dynamic name;
@dynamic radius;
@dynamic surfaceArea;
@dynamic volume;
@dynamic mass;

@end
