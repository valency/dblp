//
//  dblpViewController.h
//  DBLP
//
//  Created by Ye Ding on 2012-12-28.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dblpViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource> { }

@property (retain) NSMutableArray *tableData;
@property (retain) NSDictionary *hits;
@property BOOL firstShow;
@property (nonatomic, retain) IBOutlet UITableView *theTableView;
@property (nonatomic, retain) IBOutlet UISearchBar *theSearchBar;

@end

