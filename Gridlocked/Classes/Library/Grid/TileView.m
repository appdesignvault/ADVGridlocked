//
//  TileView.m
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

#import "TileView.h"
#import "GridView.h"

@implementation TileView

@synthesize height;
@synthesize parentView;
@synthesize title;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor whiteColor];
        [self addSubview:lbl];
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"layout Tile");
    [super layoutSubviews];
    
    [[self.subviews objectAtIndex:0] setText:title];
    
    CGRect frameView = self.frame;
    frameView.size.height = height ? height : 200;
    self.frame = frameView;
    
    //[self.parentView layoutSubviews:NO];
}

@end
