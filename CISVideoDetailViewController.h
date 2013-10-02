//
//  CISVideoDetailViewController.h
//  CIS
//
//  Created by Charles Konkol on 10/1/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CISVideoDetailViewController : UIViewController
{
    NSString *productName;
    NSString *URL;
}
@property (retain, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *URL;
@end
