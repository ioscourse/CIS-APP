//
//  CISSecondViewController.h
//  CIS
//
//  Created by Charles Konkol on 9/12/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CISSecondViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *list;
    NSArray *files;
    UIPickerView *picker;
}

@property (retain, nonatomic) IBOutlet UIPickerView *picker;

@property (retain, nonatomic) IBOutlet UIWebView *webview;

@end
