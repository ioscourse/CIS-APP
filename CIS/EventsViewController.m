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
@synthesize webview,am,refresh;

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
- (void)viewDidLoad
{
    
    [super viewDidLoad];
     [self.webview setDelegate:self]; //keeps track of all web activity
    //[self LoadPage];
  
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
    [refresh release];
       [super dealloc];
}
- (IBAction)refesh:(id)sender {
   [self LoadPage];

}
@end
