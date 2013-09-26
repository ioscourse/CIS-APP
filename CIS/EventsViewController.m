//
//  EventsViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
@synthesize webview,am;

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
     [self.webview setDelegate:self];
    // I do this because I'm in landscape mode
   // spinner is not visible until started
    [self LoadPage];
  
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *javaScript = @"function myFunction(){return 1+1;}";
    [webView stringByEvaluatingJavaScriptFromString:javaScript];
    [am stopAnimating];
    //Has fully loaded, do whatever you want here
}
- (void) LoadPage
{
   [am startAnimating];
    NSURL *myUrl = [NSURL URLWithString:@"https://sites.google.com/site/ioscisapp/home"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    [webview loadRequest:request];
  
    //am.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [webview release];
    [am release];
    [super dealloc];
}
@end
