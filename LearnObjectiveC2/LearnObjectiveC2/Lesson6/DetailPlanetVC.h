//
//  DetailPlanetVC.h
//  LearnObjectiveC2
//
//  Created by Mikhail Semerikov on 09/07/2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataService.h"
#import <CoreData/CoreData.h>
#import "CreatePlanetViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailPlanetVC : UIViewController

@property (nonatomic, strong) Planets *planet;

@end

NS_ASSUME_NONNULL_END
