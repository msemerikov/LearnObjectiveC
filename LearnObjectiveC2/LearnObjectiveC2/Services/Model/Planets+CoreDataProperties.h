//
//  Planets+CoreDataProperties.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//
//

#import "Planets+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Planets (CoreDataProperties)

+ (NSFetchRequest<Planets *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double radius;
@property (nonatomic) double surfaceArea;
@property (nonatomic) double volume;
@property (nonatomic) double mass;

@end

NS_ASSUME_NONNULL_END
