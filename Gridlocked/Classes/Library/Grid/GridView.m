//
//  GridView.m
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


#import "GridView.h"
#import "TileView.h"

@interface GridView () {
    UIScrollView    *scrollView;
    NSInteger        maxHeight;
}

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation GridView

@synthesize tileWidth, tileNumber;
@synthesize scrollView;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.exclusiveTouch = NO;
        
        [self addSubview:scrollView];
    }
    return self;
}

- (void)addTile:(id)tile {
    if ([tile isKindOfClass:[UIViewController class]]) {
        tile = ((UIViewController *)tile).view;
    }
    [scrollView addSubview:tile];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] 
                                                    initWithTarget:self action:@selector(tapGesture:)];    
    [tile addGestureRecognizer:tapGestureRecognizer];
    //[self layoutSubviews];
}

- (void)layoutSubviews {
    maxHeight = 0;
    scrollView.frame = self.bounds;
    CGFloat tileMargin = 10.0f;
    CGFloat viewWidth = !tileWidth 
                        ? (!tileNumber 
                           ? scrollView.subviews.count ? [[scrollView.subviews objectAtIndex:0] frame].size.width : 0 
                           : floor((self.bounds.size.width - (tileNumber+1)*tileMargin)/tileNumber)) 
                        : tileWidth;
    NSInteger viewNumber;
    if (tileNumber) {
        viewNumber = tileNumber;
    } else if(viewWidth) {
        viewNumber = self.bounds.size.width/viewWidth;
        while (self.bounds.size.width < (viewWidth*viewNumber + ((viewNumber+1)*tileMargin))) {
            viewNumber--;
        }
    }
    CGFloat leftGridMargin = (self.bounds.size.width - (viewWidth*viewNumber + (viewNumber-1)*tileMargin))/2;
    NSInteger row = 0;
    TileView *view;
    for (int idx = 0; idx < scrollView.subviews.count; idx++) {
        if (idx >= (row+1)*viewNumber) {
            row++;
        } 
        view = [scrollView.subviews objectAtIndex:idx]; 
        NSInteger idxOnRow = idx - (viewNumber*row);
        CGFloat tileX = leftGridMargin + idxOnRow*tileMargin + idxOnRow*viewWidth;
        NSInteger upperIdx = row > 0 ? idx-viewNumber : idx;
        TileView *upperView = [scrollView.subviews objectAtIndex:upperIdx];
        CGFloat tileY = row > 0 ? upperView.frame.origin.y + upperView.frame.size.height + tileMargin : tileMargin;
        
        view.frame = CGRectIntegral(CGRectMake(tileX, tileY, view.frame.size.width, view.frame.size.height));
        NSInteger currentHeight = tileY + view.frame.size.height + tileMargin;
        if (currentHeight > maxHeight) {
            maxHeight = currentHeight;
        }
    }
    
    scrollView.contentSize = CGSizeMake(self.bounds.size.width, maxHeight);
    
    [super layoutSubviews];
}


- (void)tapGesture:(UITapGestureRecognizer *)sender {
    [self.delegate gridView:self didSelectTileAtIndex:[self.scrollView.subviews indexOfObject:sender.view]];
}

@end
