//
//  RecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Dustin Flanary on 1/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipesTableViewDataSource : NSObject <UITableViewDataSource>

- (void) registerTableView: (UITableView *)tableView;

@end
