//
//  detailViewController.h
//  DBLP
//
//  Created by Ye Ding on 2012-12-29.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (retain) NSDictionary *detail;
@property (nonatomic, retain) IBOutlet UITextView *detailview;
@property (nonatomic, retain) IBOutlet UIButton *googlebtn;

-(IBAction)google:(id)sender;

@end
