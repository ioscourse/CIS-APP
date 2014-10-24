//
//  CISVideoViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISVideoViewController.h"

@interface CISVideoViewController ()

@end

@implementation CISVideoViewController
@synthesize webview1,am;


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
      [self.webview1 setDelegate:self];

   // [self LoadPage];
	// Do any additional setup after loading the view.
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
   // NSString *javaScript = @"function myFunction(){return 1+1;}";
   // [webView stringByEvaluatingJavaScriptFromString:javaScript];
    [am stopAnimating];
    //Has fully loaded, do whatever you want here
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

- (void) LoadPage
{
    
        [am startAnimating];
  
    NSURL *myUrl = [NSURL URLWithString:@"https://sites.google.com/site/ioscisapp/video"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    [self.webview1 loadRequest:request];

        
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
 
   
    [webview1 release];
 
    [am release];
    [super dealloc];
}
@end
