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
@synthesize picker,webview,refresh;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadPage];
   }
-(void)viewWillAppear:(BOOL)animated
{
    [self LoadPage];
}
- (void) LoadPage
{
    list = [[NSArray alloc] initWithObjects:@"CIS", @"Cisco", @"Data Assurance", @"Web", nil];
    files = [[NSArray alloc] initWithObjects:@"cis", @"cisco", @"data", @"web", nil];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *rtfUrl = [[NSBundle mainBundle] URLForResource:@"cis" withExtension:@".rtf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:rtfUrl];
    [webview loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [picker release];
    [webview release];
   
    [refresh release];
   
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
    NSURL *rtfUrl = [[NSBundle mainBundle] URLForResource:[files objectAtIndex:row] withExtension:@".rtf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:rtfUrl];
    [webview loadRequest:request];
    NSLog(@"Selected Class: %@. Index of selected Class: %i", [files objectAtIndex:row], row);
}

- (IBAction)refresh:(id)sender {
        [self LoadPage];
}
@end
