//
//  EventsViewController.h
//  CIS
//
//  Created by Charles Konkol on 9/25/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController <UIWebViewDelegate>
@property (retain, nonatomic) IBOutlet UIWebView *webview;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *am;

- (IBAction)refesh:(id)sender;
@property (retain, nonatomic) IBOutlet UINavigationItem *refresh;

@end
