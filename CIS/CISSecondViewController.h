//
//  CISSecondViewController.h
//  CIS
//
//  Created by Charles Konkol on 9/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CISSecondViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate,UIWebViewDelegate>
{
    NSArray *list;
    NSArray *files;
    UIPickerView *picker;
}

@property (retain, nonatomic) IBOutlet UIPickerView *picker;

@property (retain, nonatomic) IBOutlet UIWebView *webview;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *refresh;
- (IBAction)refresh:(id)sender;


@end
