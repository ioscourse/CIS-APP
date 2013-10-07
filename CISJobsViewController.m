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
    [self.webview setDelegate:self]; //keeps track of all web activity
    //[self LoadPage];
	// Do any additional setup after loading the view.
}

- (void) LoadPage
{
    
        NSURL *myUrl = [NSURL URLWithString:@"http://form.jotform.us/form/22629568411154"];
        NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
        [webview loadRequest:request];
        
   
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
