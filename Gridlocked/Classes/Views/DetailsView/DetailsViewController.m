//
//  DetailsViewController.m
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

#import "DetailsViewController.h"
#import "DirectionsCell.h"

@interface DetailsViewController ()

@property (strong, nonatomic) UIImage *image;

@end

@implementation DetailsViewController

@synthesize image;
@synthesize data;
@synthesize bkgView;
@synthesize btnClose;
@synthesize imageView;
@synthesize txtIngredients;
@synthesize lblTime;
@synthesize lblDificulty;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bkgView.image = [UIImage imageNamed:@"detail_bg.png"];
    
    UIImage *imgBtnClose = [[UIImage imageNamed:@"navbar_button_red.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.btnClose setBackgroundImage:imgBtnClose forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.image = [UIImage imageNamed:[data objectForKey:@"image"]];
    self.imageView.image = self.image;
    
    self.title = [data objectForKey:@"name"];
    
    self.lblDificulty.text = [data objectForKey:@"dificulty"];
    
    NSInteger time = [[data objectForKey:@"time"] intValue];
    NSInteger hours = time / 60;
    NSInteger minutes = time - hours*60;
    self.lblTime.text = hours > 0 ? [NSString stringWithFormat:@"%dh%dmin", hours, minutes] : [NSString stringWithFormat:@"%dmin", minutes];
}

- (void)viewDidUnload {
    [self setBtnClose:nil];
    [self setImageView:nil];
    [self setTxtIngredients:nil];
    [self setBkgView:nil];
    [self setLblTime:nil];
    [self setLblDificulty:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

#pragma mark - Actions

- (IBAction)closeClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - UITableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return [[data objectForKey:@"directions"] count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DirectionsCell *cell = (DirectionsCell *)[aTableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    NSString *description = [[data objectForKey:@"directions"] objectAtIndex:indexPath.row];
    cell.lblBadge.text = [NSString stringWithFormat:@"%d", indexPath.row+1];
    cell.lblDescription.text = description;
    CGRect descFrame = cell.lblDescription.frame;
    descFrame.size.height = [self heightForString:description];
    cell.lblDescription.frame = descFrame;
    
    return cell;
}


#pragma mark - UITableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *description = [[data objectForKey:@"directions"] objectAtIndex:indexPath.row];
    
    return [self heightForString:description] + 10.0f;
}

- (CGFloat)heightForString:(NSString *)string {
    CGSize stringSize = [string sizeWithFont:[UIFont fontWithName:@"Helvetica Neue" size:12.0f] constrainedToSize:self.tableView.bounds.size];
    
    return stringSize.height;
}

@end
