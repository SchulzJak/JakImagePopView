# JakImagePopView
#### 用于显示单张图片的弹出框

##### 使用步骤:

1.将项目中 ./JakImagePopView 文件夹整个拖进自己的项目中

2.在要展示弹框的ViewController中引进头文件:`#import "JakImagePopView.h"`

3.设置代理<JakImagePopViewDelegate>并实现代理中定义的方法
```
@protocol JakImagePopViewDelegate

//确定按钮的实现方法
-(void)OKBtnClicked;

//取消按钮的实现方法
-(void)CancleBtnClicked;

@end
```

4.初始化:

```
    JakImagePopView *jakImagePopView = [[JakImagePopView alloc]initWithParentView:self.view];
    jakImagePopView.delegate = self;
```

5.设置弹框的标题文字和需要展示的图片即可

```
	[jakImagePopView showWithTitle:@"弹出来看看" Image:[UIImage imageNamed:@"test"]];
```
