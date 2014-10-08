//
//  ContactViewController.h
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController  <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webview;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *am2;




@end
