//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Dustin Flanary on 1/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 10;

@interface RecipeDetailViewController ()

@property (nonatomic, strong) UIScrollView *detailScrollView;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat xAxis = 10;
    CGFloat width = self.view.frame.size.width;
    
    CGFloat titleHeight = 50;
    CGFloat descriptionHeight = 100;
    CGFloat ingredientsHeight = 30;
    CGFloat directionsHeight = 30;
    
    CGFloat titleYAxis = 20;
   
    
    self.detailScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.detailScrollView];
    self.title=@"Recipe Details";
    //[self setTitle:@"Recipe Details"];
    self.detailScrollView.alwaysBounceVertical = YES;
    self.detailScrollView.backgroundColor = [UIColor orangeColor];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis, titleYAxis, width, titleHeight)];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    titleLabel.text = [RARecipes titleAtIndex:self.recipeIndex];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleHeight = titleLabel.frame.size.height;
    [self.detailScrollView addSubview:titleLabel];

    CGFloat descriptionYAxis = titleYAxis + titleHeight + margin;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis, descriptionYAxis, width, descriptionHeight)];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.textAlignment = NSTextAlignmentLeft;
    descriptionLabel.text = [RARecipes descriptionAtIndex: self.recipeIndex];
    descriptionHeight = descriptionLabel.frame.size.height;
    //[descriptionLabel sizeToFit];
    //descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //descriptionYAxis ==
    [self.detailScrollView addSubview:descriptionLabel];
    
    CGFloat ingredientsTitleYAxis = descriptionYAxis + descriptionHeight + margin;
    
    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis,ingredientsTitleYAxis, width, ingredientsHeight)];
    ingredientsLabel.numberOfLines = 0;
    ingredientsLabel.textAlignment = NSTextAlignmentLeft;
    [ingredientsLabel setFont:[UIFont boldSystemFontOfSize:18]];

    ingredientsLabel.text = @"Ingredients";
    [self.detailScrollView addSubview:ingredientsLabel];
    
    
    //ingredientsLabel.text = [RARecipes ing];
    CGFloat ingredientsTypeHeight = 25;
    CGFloat ingredientsTypeWidth = 140;
    CGFloat volumeHeight = 100;
    CGFloat volumeWidth = 90;
    CGFloat ingredientsStuffYAxis= ingredientsTitleYAxis + 25 + margin;
    
    //for (int countHere = 0; countHere<[RARecipes count]; countHere ++){
    
    for (int i=0; i< [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        UILabel *ingredientsTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis + 5, ingredientsStuffYAxis, ingredientsTypeWidth, ingredientsTypeHeight)];
        ingredientsTypeLabel.numberOfLines = 0;
        //ingredientsTypeWidth = ingredientsTypeLabel.frame.size.width;
        [ingredientsTypeLabel setFont:[UIFont systemFontOfSize:13]];
        ingredientsTypeLabel.textAlignment = NSTextAlignmentLeft;

        ingredientsTypeLabel.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        ingredientsTypeHeight = ingredientsTypeLabel.frame.size.height;
        
        ingredientsStuffYAxis = ingredientsStuffYAxis +25 + ingredientsTypeHeight;
        [self.detailScrollView addSubview:ingredientsTypeLabel];
        
    
        
   // }
    
   // CGFloat ingredientsStuff2YAxis  = ingredientsTitleYAxis + 25 +margin;
    //Loop through and create labels for all of the ingredients
    //for (int i=0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        UILabel *volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis + ingredientsTypeWidth + margin, ingredientsStuffYAxis, volumeWidth, volumeHeight)];
        volumeLabel.numberOfLines= 0;
        volumeLabel.textAlignment=NSTextAlignmentLeft;
        
        [volumeLabel setFont:[UIFont systemFontOfSize:13]];
        //[amountLabel sizeToFit];
        //amountLabel.lineBreakMode = NSLineBreakByWordWrapping;
        volumeLabel.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        volumeHeight = volumeLabel.frame.size.height;
        ingredientsStuff2YAxis = ingredientsStuffYAxis +25 + ingredientsTypeHeight;
        [self.detailScrollView addSubview: volumeLabel];
    
    
    }
    
/* for (int i= 0; i < [RARecipes directionsAtIndex:self.recipeIndex].count; i++){
    {
        NSString *directionParagraph = [RARecipes directionsAtIndex:self.recipeIndex][i];
    }
 
 The above comment is so I can see the traditional longer way of doing an array. */
    
    
    //UILabel *directionsTitleLabel = [[UILabel alloc] initWithFrame:<#(CGRect)#>]
    //[directionsTitleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    
    CGFloat directionsTitleYAxis = ingredientsStuffYAxis + ingredientsHeight + margin;
    CGFloat directionsYAxis = directionsTitleYAxis + 25 + margin;
    
    UILabel *directionsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis, directionsTitleYAxis, width, directionsHeight)];
    directionsTitleLabel.numberOfLines = 0;
    directionsTitleLabel.textAlignment = NSTextAlignmentLeft;
    [directionsTitleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    directionsTitleLabel.text = @"Directions";
    [self.detailScrollView addSubview:directionsTitleLabel];
    
    for (NSString *directionParagraph in [RARecipes directionsAtIndex:self.recipeIndex]){
        UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxis, directionsYAxis, width, directionsHeight)];
        directionsLabel.numberOfLines = 0;
        directionsLabel.textAlignment = NSTextAlignmentLeft;
        directionsLabel.text = directionParagraph;
        [directionsLabel setFont:[UIFont systemFontOfSize:15]];
        directionsHeight = directionsLabel.frame.size.height + 15;
        directionsYAxis = directionsYAxis + directionsHeight;
        directionsLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //[directionsLabel sizeToFit];
        [self.detailScrollView addSubview:directionsLabel];
    }
    
    self.detailScrollView.contentSize = CGSizeMake(width, directionsYAxis + directionsHeight);
    
    
    //descriptionLabel.text = self.recipeIndex;
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
