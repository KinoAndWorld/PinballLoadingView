# PinballLoadingView

Swift写的一个加载页效果，觉得比较有趣~当做练手

![Screenshot](http://ww2.sinaimg.cn/mw1024/6ff7b43egw1erti08ug2jg20hk0vcx6p.gif  =320x568) 

## Usage

基础用法
```swift
        let loadingView = PinballLoadingView()
        loadingView.backColor = UIColor.whiteColor()
        loadingView.showInWindow()
```

用完之后 
```swift 
       loadingView.stopAnimateAndDismiss()
```


自定义背景视图
```swift
        loadingView.configureBackView = { (frame:CGRect) -> UIView in
            let contentView = UIView(frame: frame)
            //custom yourself view
            return contentView
        }
```

自定义小球大小和颜色
```swift
        loadingView.configureBallInfo = { (index:Int) -> (CGSize, UIColor) in
            return (CGSizeMake(25, 25), UIColor(red: 0.1, green: CGFloat(index+1)*0.1, blue: 0.3, alpha: 0.8))
        }
```


### License

`PinballLoadingView` is released under the MIT license.

### Author

Kino

`Email: 992276678@qq.com/ kinoandworld@gmail.com`

`Weibo: http://weibo.com/u/1878504510`

contact me if had any quetion .
