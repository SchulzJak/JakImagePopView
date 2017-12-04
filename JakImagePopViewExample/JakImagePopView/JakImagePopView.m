//
//  JakImagePopView.m
//  JakWeibo
//
//  Created by Zyh on 2017/12/4.
//  Copyright © 2017年 Gfound. All rights reserved.
//

#import "JakImagePopView.h"

@interface JakImagePopView()

@property(nonatomic,strong)UIView *centerView;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UIImageView * imageView;

@property(nonatomic,strong)UIButton *OKBtn;

@property(nonatomic,strong)UIButton *cancleBtn;

@property(nonatomic,strong)UIImage *image;

@end

@implementation JakImagePopView

#define CenterViewWidth  0.7 * self.frame.size.width //弹框宽度

- (instancetype)initWithParentView:(UIView *)parentView
{
    self = [super init];
    if (self) {
        _parentView = parentView;
        [self layout];
    }
    return self;
}


-(void)layout{
    self.frame = _parentView.frame;
    self.backgroundColor = [UIColor colorWithRed:1.0/255.0 green:1.0/255.0 blue:1.0/255.0 alpha:0.6f] ;

}

-(void)showWithTitle:(NSString *)title Image:(UIImage *)image{
    self.image = image;
    [self centerView];
    self.imageView.image = image;
    self.titleLabel.text = title;
    [self.OKBtn addTarget:self action:@selector(OKBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.cancleBtn addTarget:self action:@selector(CancleBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.parentView addSubview:self];
}


-(void)hideJakImageView{
    [UIView animateWithDuration:0.5f animations:^{
        [self removeFromSuperview];
    }];
}

#pragma mark --  lazy load

-(UIImageView *)imageView
{
    if(!_imageView){
        CGFloat scale = self.image.size.height/self.image.size.width;
        self.imageView = [[UIImageView alloc]init];
//        CGFloat interval = 1- scale > 0?1- scale:scale -1;
        self.imageView.frame = CGRectMake(0, 40, CenterViewWidth, CenterViewWidth * scale);
        [self.centerView addSubview:self.imageView];
    }
    return _imageView;
}

-(UILabel *)titleLabel
{
    if(!_titleLabel){
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.frame = CGRectMake(0, 0, CenterViewWidth, 40);
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.centerView addSubview:self.titleLabel];
    }
    return _titleLabel;;
}

-(UIView *)centerView
{
    if(!_centerView){
        CGFloat scale = self.image.size.height/self.image.size.width;
        self.centerView = [[UIView alloc]initWithFrame:CGRectMake((self.frame.size.width -CenterViewWidth)/2, (self.bounds.size.height - (CenterViewWidth * scale + 80))/2,CenterViewWidth, CenterViewWidth  * scale+ 80)];
        self.centerView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.centerView.layer.borderWidth = 1.0f;
        self.centerView.layer.cornerRadius = 5.0f;
        self.centerView.layer.masksToBounds = YES;
        
        [self addSubview:self.centerView];
    }
    return _centerView;
}

-(UIButton *)OKBtn
{
    if(!_OKBtn){
        self.OKBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.imageView.bounds.origin.y +self.imageView.bounds.size.height + 40, CenterViewWidth/2,40)];
        [self.OKBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.OKBtn setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
        [self.OKBtn setBackgroundColor:[UIColor whiteColor]];
        [self.centerView addSubview:self.OKBtn];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(CenterViewWidth/2 - 0.5, self.imageView.bounds.origin.y +self.imageView.bounds.size.height + 41, 1, 38)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.centerView addSubview:line];
    }
    return _OKBtn;
}

-(UIButton *)cancleBtn
{
    if(!_cancleBtn){
        self.cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(CenterViewWidth/2+0.5, self.imageView.bounds.origin.y +self.imageView.bounds.size.height + 40, CenterViewWidth/2, 40)];
        [self.cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancleBtn setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
        [self.cancleBtn setBackgroundColor:[UIColor whiteColor]];
        [self.centerView addSubview:self.cancleBtn];
    }
    return _cancleBtn;
}

#pragma mark --  JakImagePopViewDelegate

-(void)OKBtnClicked;
{
    [self.delegate OKBtnClicked];
    [self hideJakImageView];
}

-(void)CancleBtnClicked;
{
    [self.delegate CancleBtnClicked];
    [self hideJakImageView];
}



@end
