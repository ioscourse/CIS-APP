//
//  CISSecondViewController.m
//  CIS
//
//  Created by Charles Konkol on 9/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "CISSecondViewController.h"

@interface CISSecondViewController ()

@end

@implementation CISSecondViewController
@synthesize picker,refresh;

- (void)viewDidLoad
{
    [super viewDidLoad];
  // [self.webview setDelegate:self]; //keeps track of all web activity

   // [self LoadPage];
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
    
        list = [[NSArray alloc] initWithObjects:@"CIS", @"Cisco", @"Data Assurance", @"Web", nil];
        files = [[NSArray alloc] initWithObjects:@"cis", @"cisco", @"data", @"web", nil];
        // Do any additional setup after loading the view, typically from a nib.
    NSURL *rtfPath = [[NSBundle mainBundle] URLForResource: @"cis" withExtension:@"rtf"];
    NSAttributedString *attributedStringWithRtf = [[NSAttributedString alloc]   initWithFileURL:rtfPath options:@{NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType} documentAttributes:nil error:nil];
    self.textview.attributedText=attributedStringWithRtf;
     //   [webview loadRequest:request];
         [picker reloadAllComponents];
 
    
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
    [picker release];
   // [webview release];
   
    [refresh release];
   
    [_textview release];
    [super dealloc];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return list.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [list objectAtIndex:row];
}
//PickerViewController.m
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    NSURL *rtfUrl = [[NSBundle mainBundle] URLForResource:[files objectAtIndex:row] withExtension:@".rtf"];
 //   NSURLRequest *request = [NSURLRequest requestWithURL:rtfUrl];
//    [webview loadRequest:request];
    
    NSURL *rtfPath = [[NSBundle mainBundle] URLForResource:[files objectAtIndex:row] withExtension:@".rtf"];
    NSAttributedString *attributedStringWithRtf = [[NSAttributedString alloc]   initWithFileURL:rtfPath options:@{NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType} documentAttributes:nil error:nil];
    self.textview.attributedText=attributedStringWithRtf;
    
    NSLog(@"Selected Class: %@. Index of selected Class: %li", [files objectAtIndex:row], (long)row);
}

- (IBAction)refresh:(id)sender {
        [self LoadPage];
}
@end
