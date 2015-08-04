//
//  dblpViewController.m
//  DBLP
//
//  Created by Ye Ding on 2012-12-28.
//  Copyright (c) 2012 Ye Ding. All rights reserved.
//

#import "dblpViewController.h"
#import "detailViewController.h"

@interface dblpViewController ()

@end

@implementation dblpViewController

@synthesize tableData;
@synthesize hits;
@synthesize theTableView;
@synthesize theSearchBar;
@synthesize firstShow;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableData =[[NSMutableArray alloc]init];
}

- (void)viewDidAppear:(BOOL)animated {
    if(firstShow != true) {
        firstShow = true;
        [self.theSearchBar becomeFirstResponder];
    }
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    self.theTableView.allowsSelection = NO;
    self.theTableView.scrollEnabled = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text=@"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.theTableView.allowsSelection = YES;
    self.theTableView.scrollEnabled = YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    // Load dblp data
    NSError *error;
    NSString *encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[self.theSearchBar text],NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8);
    NSString *url = [NSString stringWithFormat:@"http://dblp.org/search/api/?q=%@&format=json",encodedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    hits = [[[dic objectForKey:@"result"] objectForKey:@"hits"] objectForKey:@"hit"];
    for (NSDictionary *hit in hits){
        NSString *h = [[hit objectForKey:@"info"] objectForKey:@"title"];
        [searchResults addObject:h];
    }
    NSArray *results = (NSArray *)searchResults;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.theTableView.allowsSelection = YES;
    self.theTableView.scrollEnabled = YES;
    [self.tableData removeAllObjects];
    [self.tableData addObjectsFromArray:results];
    [self.theTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableId = @"maintable";
    UITableViewCell *cell = [self.theTableView dequeueReusableCellWithIdentifier: tableId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableId] ;
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [tableData objectAtIndex:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    detailViewController *theDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    int i = 0;
    for (NSDictionary *hit in hits){
        if(i==[indexPath row]) {
            theDetailViewController.detail = [hit objectForKey:@"info"];
            break;
        }
        i++;
    }
    [self.navigationController pushViewController:theDetailViewController animated:true];
}

@end
