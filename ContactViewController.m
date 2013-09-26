//
//  ContactViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController
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
    NSURL *myUrl = [NSURL URLWithString:@"http://form.jotform.us/form/22908822234150"];
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
