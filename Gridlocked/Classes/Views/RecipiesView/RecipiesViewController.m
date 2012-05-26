//
//  RecipiesViewController.m
//  grid
//
//  Created by Valentin Filip on 4/29/12.
//  Copyright (c) 2012 Universitatea Babeș-Bolyai. All rights reserved.
//
/*
 The MIT License
 
 Copyright (c) 2011 Tope Abayomi
 http://www.appdesignvault.com/
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "RecipiesViewController.h"
#import "RecipieTileCell.h"
#import "DetailsViewController.h"

@interface RecipiesViewController () {
    NSInteger selectedTile;
    NSArray *recipes;
}

@property (nonatomic, strong) NSArray *recipes;

- (NSArray *)datasource;
- (void)createCellWithData:(NSDictionary *)data;

@end

@implementation RecipiesViewController

@synthesize recipes;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.autoresizesSubviews = YES;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    self.title = @"Recipies (tap on the tiles)";
    
    grid = [[GridView alloc] initWithFrame:self.view.bounds];
    grid.delegate = self;
    grid.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:grid];
    
    recipes = [self datasource];
    
    for (NSDictionary *recipe in recipes) {
        [self createCellWithData:recipe];
    }
}

- (void)viewDidUnload {
    [self setRecipes:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark - GridView datasource

- (void)createCellWithData:(NSDictionary *)data {
    RecipieTileCell *tile = (RecipieTileCell *)[[[NSBundle mainBundle] loadNibNamed:@"RecipieTileCell" owner:self options:nil] objectAtIndex:0];
    tile.data = data;
    [grid addTile:tile];
}

#pragma mark - GridView delegate

- (void)gridView:(GridView *)gridView didSelectTileAtIndex:(NSInteger)index {
    selectedTile = index;
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        UINavigationController *nav = segue.destinationViewController;
        DetailsViewController *detailsVC = [nav.viewControllers objectAtIndex:0];
        detailsVC.data = [recipes objectAtIndex:selectedTile];
    }
}

#pragma mark - Data

- (NSArray *)datasource {
    NSArray *instructions = [NSArray arrayWithObjects:
                             @"Soak cherries, mango, cranberries, currants, and citron in 1/4 cup rum for at least 24 hours. Cover tightly, and store at room temperature."
                             , @"Preheat oven to 325 degrees F (165 degrees C). Butter a 6x3 inch round pan, and line with parchment paper."
                             , @"In a large bowl, cream together butter and brown sugar until fluffy. Beat in egg. Whisk together flour, baking soda, salt, and cinnamon; mix into butter and sugar in three batches, alternating with molasses and milk. Stir in soaked fruit and chopped nuts. Scrape batter into prepared pan."
                             , @"Bake in preheated oven for 40 to 45 minutes. Cool in the pan for 10 minutes, then sprinkle with 2 tablespoons rum."
                             , @"Cut out one piece parchment paper and one piece cheesecloth, each large enough to wrap around the cake. Moisten cheesecloth with 1 tablespoon rum. Arrange cheesecloth on top of parchment paper, and unmold cake onto it. Sprinkle top and sides of cake with remaining rum."
                             , nil];
    
    return [NSArray arrayWithObjects:
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"recipe0", @"image"
             , @"Cherry Cake", @"name"
             , @"Intermediate", @"dificulty"
             , instructions, @"directions"
             , [NSNumber numberWithInt:90], @"time"
             , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe1", @"image"
               , @"Decorated Dish", @"name"
               , @"Beginner", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:30], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe2", @"image"
               , @"Beef Stake", @"name"
               , @"Intermediate", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:135], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe3", @"image"
               , @"Fruit Salad", @"name"
               , @"Beginner", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:70], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe4", @"image"
               , @"Cherry Cake", @"name"
               , @"Advanced", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:105], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe3", @"image"
               , @"Fruit Salad", @"name"
               , @"Beginner", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:70], @"time"
               , nil]
            ,  [NSDictionary dictionaryWithObjectsAndKeys:
                @"recipe0", @"image"
                , @"Cherry Cake", @"name"
                , @"Intermediate", @"dificulty"
                , instructions, @"directions"
                , [NSNumber numberWithInt:90], @"time"
                , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe4", @"image"
               , @"Cherry Cake", @"name"
               , @"Advanced", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:105], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe0", @"image"
               , @"Cherry Cake", @"name"
               , @"Intermediate", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:90], @"time"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe1", @"image"
               , @"Decorated Dish", @"name"
               , @"Beginner", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:30], @"time"
               , nil]
            ,  [NSDictionary dictionaryWithObjectsAndKeys:
                @"recipe2", @"image"
                , @"Beef Stake", @"name"
                , @"Intermediate", @"dificulty"
                , instructions, @"directions"
                , [NSNumber numberWithInt:135], @"time"
                , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"recipe1", @"image"
               , @"Decorated Dish", @"name"
               , @"Beginner", @"dificulty"
               , instructions, @"directions"
               , [NSNumber numberWithInt:30], @"time"
               , nil]
            , nil];
}

@end
