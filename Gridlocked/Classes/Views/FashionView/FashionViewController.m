//
//  ViewController.m
//  grid
//
//  Created by Valentin Filip on 4/24/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
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

#import "FashionViewController.h"
#import "GridView.h"
#import "FashionTileCell.h"

@interface FashionViewController ()

- (NSArray *)datasource;
- (void)createCellWithData:(NSDictionary *)data;

@end

@implementation FashionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.autoresizesSubviews = YES;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    grid = [[GridView alloc] initWithFrame:self.view.bounds];
    grid.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:grid];
    
    NSArray *items = [self datasource];
    
    for (NSDictionary *item in items) {
        [self createCellWithData:item];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - GridView datasource

- (void)createCellWithData:(NSDictionary *)data {
    FashionTileCell *tile = (FashionTileCell *)[[[NSBundle mainBundle] loadNibNamed:@"FashionTileCell" owner:self options:nil] objectAtIndex:0];
    tile.data = data;
    [grid addTile:tile];
}

#pragma mark - Data

- (NSArray *)datasource {
    return [NSArray arrayWithObjects:
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"dress0", @"image"
             , [NSNumber numberWithInt:8], @"likes"
             , [NSNumber numberWithInt:0], @"comments"
             , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress1", @"image"
               , [NSNumber numberWithInt:6], @"likes"
               , [NSNumber numberWithInt:2], @"comments"
               , [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:
                   @"John Doe", @"title"
                   , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                   , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , nil], @"data"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress2", @"image"
               , [NSNumber numberWithInt:8], @"likes"
               , [NSNumber numberWithInt:1], @"comments"
               , [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:
                   @"John Doe", @"title"
                   , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                   , nil]
                  , nil], @"data"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress1", @"image"
               , [NSNumber numberWithInt:7], @"likes"
               , [NSNumber numberWithInt:0], @"comments"
               , [NSArray arrayWithObjects:nil], @"data"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress0", @"image"
               , [NSNumber numberWithInt:3], @"likes"
               , [NSNumber numberWithInt:2], @"comments"
               , [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:
                   @"John Doe", @"title"
                   , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                   , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , nil], @"data"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress2", @"image"
               , [NSNumber numberWithInt:1], @"likes"
               , [NSNumber numberWithInt:4], @"comments"
               , [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:
                   @"John Doe", @"title"
                   , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                   , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , nil], @"data"
               , nil]
            , [NSDictionary dictionaryWithObjectsAndKeys:
               @"dress1", @"image"
               , [NSNumber numberWithInt:2], @"likes"
               , [NSNumber numberWithInt:2], @"comments"
               , [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:
                   @"John Doe", @"title"
                   , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                   , nil]
                  , [NSDictionary dictionaryWithObjectsAndKeys:
                     @"John Doe", @"title"
                     , @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", @"description"
                     , nil]
                  , nil], @"data"
               , nil]
            , nil];
}

@end
