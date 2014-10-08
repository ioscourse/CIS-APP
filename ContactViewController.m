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
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        [self LoadPage];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self.webview setDelegate:self]; //keeps track of all web activity
    //[self LoadPage];
	// Do any additional setup after loading the view.
}
- (BOOL) checkinternet
{
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
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
