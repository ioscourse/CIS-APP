//
//  CISVideoDetailViewController.m
//  CIS
//
//  Created by Charles Konkol on 10/1/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISVideoDetailViewController.h"

@interface CISVideoDetailViewController ()

@end

@implementation CISVideoDetailViewController
@synthesize webview,productName,URL;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *code = URL;
    [[self webview]loadHTMLString:code baseURL:nil];
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
