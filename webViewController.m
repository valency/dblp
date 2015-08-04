//
//  webViewController.m
//  DBLP
//
//  Created by Ye Ding on 2012-12-29.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

@synthesize url,webview;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
