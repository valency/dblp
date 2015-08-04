//
//  detailViewController.m
//  DBLP
//
//  Created by Ye Ding on 2012-12-29.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import "detailViewController.h"
#import "webViewController.h"

@interface detailViewController()

@end

@implementation detailViewController

@synthesize detail;
@synthesize detailview;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *c = @"Title:\n";
    NSString *title = [detail objectForKey:@"title"];
    title = [title stringByReplacingOccurrencesOfString:@"." withString:@""];
    c = [c stringByAppendingString:title];
    c = [c stringByAppendingString:@"\n\n\nAuthor:\n"];
    int i = 0;
    NSString *author = @"";
    for (NSString *a in [[detail objectForKey:@"authors"] objectForKey:@"author"]) {
        if (i > 0) author = [author stringByAppendingString:@", "];
        author = [author stringByAppendingString:a];
        i++;
    }
    c = [c stringByAppendingString:author];
    c = [c stringByAppendingString:@"\n\n\nVenue:\n"];
    c = [c stringByAppendingString:[detail objectForKey:@"venue"]];
    [detailview setText:c];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)google:(id)sender {
    webViewController *thewebViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"webViewController"];
    NSString *q = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[detail objectForKey:@"title"],NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8);
    thewebViewController.url = [NSString stringWithFormat:@"http://scholar.google.com/scholar?hl=en&q=%@",q];
    [self.navigationController pushViewController:thewebViewController animated:true];
}

@end
