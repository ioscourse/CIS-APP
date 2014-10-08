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


- (void)viewDidLoad
{
    [super viewDidLoad];
  //  [self LoadPage];
   	// Do any additional setup after loading the view, typically from a nib.
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
- (void) LoadPage
{
    

    
    NSURL *rtfPath = [[NSBundle mainBundle] URLForResource: @"home" withExtension:@"rtf"];
    NSAttributedString *attributedStringWithRtf = [[NSAttributedString alloc]   initWithFileURL:rtfPath options:@{NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType} documentAttributes:nil error:nil];
    self.textview.attributedText=attributedStringWithRtf;


   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void)dealloc {
    [_textview release];
    [super dealloc];
}
@end
