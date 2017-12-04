//
//  JakImagePopView.h
//  JakWeibo
//
//  Created by Zyh on 2017/12/4.
//  Copyright © 2017年 Gfound. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JakImagePopViewDelegate

-(void)OKBtnClicked;

-(void)CancleBtnClicked;

@end

@interface JakImagePopView : UIView


@property(nonatomic,strong)UIView *parentView;

- (instancetype)initWithParentView:(UIView *)parentView;

-(void)showWithTitle:(NSString *)title Image:(UIImage *)image;

@property (nonatomic, assign) id <JakImagePopViewDelegate> _Nonnull delegate;

@end
