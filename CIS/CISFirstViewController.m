//
//  CISFirstViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISFirstViewController.h"

@interface CISFirstViewController ()

@end

@implementation CISFirstViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadPage];
   	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self LoadPage];
}
- (void) LoadPage
{
    NSURL *rtfUrl = [[NSBundle mainBundle] URLForResource:@"home" withExtension:@".rtf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:rtfUrl];
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
