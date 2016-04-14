//
//  UIView+frame.m
//  CYPhotoBrowser
//
//  Created by jeader on 16/4/14.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "UIView+frame.h"

#define size self.frame.size
#define origin self.frame.origin

@implementation UIView (frame)

-(CGFloat)width
{
    return size.width;
}

-(void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(origin.x, origin.y, width, size.height);
}

-(CGFloat)height
{
    return size.height;
}

-(void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(origin.x, origin.y, size.width, height);
}

-(CGFloat)x
{
    return origin.x;
}

-(void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, origin.y, size.width, size.height);
}

-(CGFloat)y
{
    return origin.y;
}

-(void)setY:(CGFloat)y
{
    self.frame = CGRectMake(origin.x, y, size.width, size.height);
}

@end
