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
@synthesize webview,am2;


-(void)viewWillAppear:(BOOL)animated
{
    [self LoadPage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.webview setDelegate:self]; //keeps track of all web activity
    [self LoadPage];
	// Do any additional setup after loading the view.
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *javaScript = @"function myFunction(){return 1+1;}";
    [webView stringByEvaluatingJavaScriptFromString:javaScript];
    [am2 stopAnimating];
    //Has fully loaded, do whatever you want here
}
- (void) LoadPage
{
     [am2 startAnimating];
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
     [am2 release];
    [super dealloc];
}
@end
