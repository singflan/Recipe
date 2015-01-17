//
//  RARecipes.h
//  Recipe App
//
//  Created by Dustin Flanary on 1/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RARecipes : NSObject

+ (NSInteger)count;
+ (NSDictionary *)recipeAtIndex:(NSInteger)index;
+ (NSString *)titleAtIndex:(NSInteger)index;
+ (NSString *)descriptionAtIndex:(NSInteger)index;
+ (NSInteger)ingredientCountAtIndex:(NSInteger)index;
+ (NSString *)ingredientTypeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;
+ (NSString *)ingredientVolumeAtIndex:(NSInteger)ingIndex inRecipeAtIndex:(NSInteger)recIndex;
+ (NSArray *)directionsAtIndex:(NSInteger)index;


@end
