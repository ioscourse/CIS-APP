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
@synthesize webview1,webview2,webview3,am;


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
     [self.webview2 setDelegate:self];
     [self.webview3 setDelegate:self];
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
- (void) setupMainView_iPhone
{
    [webview1 setAllowsInlineMediaPlayback:YES];
    [webview2 setAllowsInlineMediaPlayback:YES];
    [webview3 setAllowsInlineMediaPlayback:YES];
    NSString *code = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">MyCIS</font>";
    [[self webview1]loadHTMLString:code baseURL:nil];
    
    NSString *code2 = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">Student Apps!</font>";
    [[self webview2]loadHTMLString:code2 baseURL:nil];
    
    NSString *code3 = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">Cisco</font>";
    [[self webview3]loadHTMLString:code3 baseURL:nil];

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
- (void) setupMainView_iPad
{
    [webview1 setAllowsInlineMediaPlayback:YES];
      [webview2 setAllowsInlineMediaPlayback:YES];
      [webview3 setAllowsInlineMediaPlayback:YES];
    NSString *code = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">MyCIS</font>";
    [[self webview1]loadHTMLString:code baseURL:nil];
    
    NSString *code2 = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\"  frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">Student Apps!</font>";
    [[self webview2]loadHTMLString:code2 baseURL:nil];
    
    NSString *code3 = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe><br><font size=\"20\">Cisco</font>";
    [[self webview3]loadHTMLString:code3 baseURL:nil];

}
- (void) LoadPage
{
    
        [am startAnimating];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            
            [self setupMainView_iPhone];
            
        }
        
        else {
            
            [self setupMainView_iPad];
            
        }

        
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
 
   
    [webview1 release];
    [webview3 release];
    [webview2 release];
    [am release];
    [super dealloc];
}
@end
