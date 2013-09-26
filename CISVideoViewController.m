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
      [self.webview1 setDelegate:self];
     [self.webview2 setDelegate:self];
     [self.webview3 setDelegate:self];
    [self LoadPage];
	// Do any additional setup after loading the view.
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
    NSString *code = @"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self webview1]loadHTMLString:code baseURL:nil];
    
    NSString *code2 = @"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self webview2]loadHTMLString:code2 baseURL:nil];
    
    NSString *code3 = @"<iframe width=\"640\" height=\"480\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self webview3]loadHTMLString:code3 baseURL:nil];
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
