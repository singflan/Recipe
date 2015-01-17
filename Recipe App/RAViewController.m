//
//  RAViewController.m
//  Recipe App
//
//  Created by Dustin Flanary on 1/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"
#import "RARecipes.h"

@interface RAViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Recipes";
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.dataSource = [[RecipesTableViewDataSource alloc] init];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    
}

/*-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self recipes] count];
}*/

/*-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = [[self recipes] objectAtIndex:indexPath.row];
    return cell;
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSString * recipe = [[self recipes] objectAtIndex:indexPath.row];
    RecipeDetailViewController *detailViewController = [RecipeDetailViewController new];
    detailViewController.recipeIndex = indexPath.row;
    //it has a method can use to grab the recipe.
    [self.navigationController pushViewController:detailViewController animated:YES];


    
//[self.navigationController.recipeIndex = indexPath.row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
