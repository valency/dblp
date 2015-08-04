//
//  webViewController.h
//  DBLP
//
//  Created by Ye Ding on 2012-12-29.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController <UIWebViewDelegate>

@property (retain) NSString *url;
@property (retain, nonatomic) IBOutlet UIWebView *webview;

@end
