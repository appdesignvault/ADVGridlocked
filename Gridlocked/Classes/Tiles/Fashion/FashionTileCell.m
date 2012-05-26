//
//  FashionTileCell.m
//  grid
//
//  Created by Valentin Filip on 4/26/12.
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

#import "FashionTileCell.h"

@interface FashionTileCell ()

@property (strong, nonatomic) UIImage *image;

- (UIImageView *)backgroundForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

static CGFloat const RowHeight = 110.0f;

@implementation FashionTileCell

@synthesize image;
@synthesize data;
@synthesize imageView;
@synthesize statusView;
@synthesize tableView;
@synthesize bkgImageView;
@synthesize lblLikes;
@synthesize lblComm;

- (void)layoutSubviews {
    [super layoutSubviews];
    self.image = [UIImage imageNamed:[data objectForKey:@"image"]];
    
    CGRect imageFrame = self.imageView.frame;
    imageFrame.size = self.image.size;
    self.imageView.frame = imageFrame;
    self.imageView.image = image;
    
    CGRect statusFrame = self.statusView.frame;
    statusFrame.origin.y = 2*imageFrame.origin.y + imageFrame.size.height;
    self.statusView.frame = CGRectIntegral(statusFrame);
    
    self.lblLikes.text = [NSString stringWithFormat:@"%@", [data objectForKey:@"likes"]];
    self.lblComm.text = [NSString stringWithFormat:@"%@", [data objectForKey:@"comments"]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
    
    CGRect tableFrame = self.tableView.frame;
    tableFrame.origin.y = statusFrame.origin.y+statusFrame.size.height;
    tableFrame.size.height = [[data objectForKey:@"data"] count] * RowHeight;
    self.tableView.frame = CGRectIntegral(tableFrame);
    
    CGRect cellFrame = self.frame;
    cellFrame.size.height = tableFrame.origin.y + tableFrame.size.height + (tableFrame.size.height ? 5 : 2);
    self.frame = CGRectIntegral(cellFrame);
    
    [self.superview.superview layoutSubviews];
}

#pragma mark - Tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[data objectForKey:@"data"] count];
}

- (UIImageView *)backgroundForCellAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *imgBkg;
    UIImageView *imgViewBkg = nil;
    
    NSInteger rowCount = [[data objectForKey:@"data"] count];
    if(indexPath.row != rowCount-1) {
        imgBkg = [UIImage imageNamed:@"row_bg.png"];
        imgViewBkg = [[UIImageView alloc] initWithImage:[imgBkg stretchableImageWithLeftCapWidth:5 topCapHeight:5]];
    }
    imgViewBkg.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    return imgViewBkg;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSDictionary *item = [[data objectForKey:@"data"] objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"title"];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    
    cell.detailTextLabel.text = [item objectForKey:@"description"];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12.0];
    cell.detailTextLabel.numberOfLines = 0;
    
    cell.backgroundView = [self backgroundForCellAtIndexPath:indexPath];
    return cell;
}

#pragma mark - Tableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RowHeight;
}

@end
