//
//  CISVideoViewController.h
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CISVideoViewController : UIViewController <UIWebViewDelegate>
{
    
}

@property (retain, nonatomic) IBOutlet UIWebView *webview1;
@property (retain, nonatomic) IBOutlet UIWebView *webview3;
@property (retain, nonatomic) IBOutlet UIWebView *webview2;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *am;

@end
