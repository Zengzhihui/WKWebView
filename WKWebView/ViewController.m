//
//  ViewController.m
//  WKWebView
//
//  Created by zzh on 16/11/2.
//  Copyright © 2016年 Gavin Zeng. All rights reserved.
//

#import "ViewController.h"
#import "GZWKWebView.h"

@interface ViewController ()
@property(nonatomic,strong) GZWKWebView *webView;
@property(nonatomic,strong) UIScrollView *contentView;
@property(nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _webView = [GZWKWebView new];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mp.weixin.qq.com/s?__biz=MjM5NTIyNTUyMQ==&mid=2709545242&idx=1&sn=37166b9b69fc235b4e5ad6171808dffa&chksm=828f0bc4b5f882d2110af2059ed3120c7650ea4302d1aead6ab6619103898bd0112a314271d4&scene=0#wechat_redirect"]]];
    [self.view addSubview:_webView];
    _webView.frame = CGRectMake(0, 20, self.view.frame.size.width, (self.view.frame.size.height - 20) * 0.5 - 10);
    
    _contentView = [UIScrollView new];
    _contentView.frame = CGRectMake(0, self.view.frame.size.height * 0.5 + 10, self.view.frame.size.width, (self.view.frame.size.height - 20) * 0.5 - 10);
    [self.view addSubview:_contentView];
    
    _imageView = [UIImageView new];
    _imageView.frame = _contentView.bounds;
    [_contentView addSubview:_imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"截图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 100, 30);
    button.alpha = 0.3;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchDown];
}

- (void)buttonAction{
    __weak typeof(self) wSelf = self;
    [_webView captureContentImage:^(UIImage *image) {
        wSelf.imageView.image = image;
        wSelf.imageView.frame = CGRectMake(0, 0, wSelf.imageView.frame.size.width, image.size.height);
        wSelf.contentView.contentSize = CGSizeMake(wSelf.imageView.frame.size.width, image.size.height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
