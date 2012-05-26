//
//  RecipieTileCell.m
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

#import "RecipieTileCell.h"
#import "GridView.h"

@interface RecipieTileCell ()

@property (strong, nonatomic) UIImage *image;

@end


@implementation RecipieTileCell

@synthesize data;
@synthesize image;
@synthesize imageView;
@synthesize statusView;
@synthesize bkgImageView;
@synthesize lblName;
@synthesize lblTime;


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
    
    self.lblName.text = [NSString stringWithFormat:@"%@", [data objectForKey:@"name"]];
    
    NSInteger time = [[data objectForKey:@"time"] intValue];
    NSInteger hours = time / 60;
    NSInteger minutes = time - hours*60;
    self.lblTime.text = [NSString stringWithFormat:@"%dh%d", hours, minutes];
        
    CGRect cellFrame = self.frame;
    cellFrame.size.height = statusFrame.origin.y + statusFrame.size.height;
    self.frame = CGRectIntegral(cellFrame);
    
    [self.superview.superview layoutSubviews];
}
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"tap");
    [((GridView *)self.superview) tapGesture:self];
}
*/
@end
