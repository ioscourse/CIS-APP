//
//  CISJobsViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/26/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISJobsViewController.h"

@interface CISJobsViewController ()

@end

@implementation CISJobsViewController
@synthesize webview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self LoadPage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadPage];
	// Do any additional setup after loading the view.
}

- (void) LoadPage
{
    NSURL *myUrl = [NSURL URLWithString:@"http://form.jotform.us/form/22629568411154"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    [webview loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [webview release];
    [super dealloc];
}
@end
