//
//  UIImageView+photoBrowser.m
//  eTaxi-iOS
//
//  Created by jeader on 16/3/9.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "UIImageView+photoBrowser.h"
#import "UIView+frame.h"
//#import "HeadFile.pch"

#define CYWidth [UIScreen mainScreen].bounds.size.width
#define CYHeight [UIScreen mainScreen].bounds.size.height

static UIView *_view;
static UIView *_backView;
static UIImageView *_imageView;
static CGRect _rect;

@implementation UIImageView (photoBrowser)

/**
 *  显示大图片
 */
-(void)showBiggerPhotoInview:(UIView *)view
{
    
    _view = view;
    
    self.userInteractionEnabled = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:self.bounds];
    [btn addTarget:self action:@selector(clickImageV) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

-(void)clickImageV
{
    
    [_view endEditing:YES];
    
    UIView *backView = [[UIView alloc] initWithFrame:_view.bounds];
    _backView = backView;
    backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    [_view addSubview:backView];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //将图片的坐标转换成window上的坐标
    CGRect rect = [self convertRect:self.bounds toView:window];
    _rect = rect;
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:rect];
    _imageView = imageV;
    imageV.image = self.image;
    
    [backView addSubview:imageV];
    
    CGFloat imageW = CYWidth;
    CGFloat imageH = imageW;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        imageV.x = 0;
        imageV.y = (CYHeight-imageH)/2;
        imageV.width = imageW;
        imageV.height = imageH;
        
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:backView.bounds];
    [backView addSubview:btn];
    [btn addTarget:self action:@selector(clickView) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        _imageView.frame = _rect;
    } completion:^(BOOL finished) {
        [_backView removeFromSuperview];
        
    }];
    
}

@end
