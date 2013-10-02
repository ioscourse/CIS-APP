//
//  CISMasterViewController.h
//  CIS
//
//  Created by Charles Konkol on 10/1/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CISMasterViewController : UITableViewController
{
    NSArray *list;
    NSArray *Youtube;
}
@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *Youtube;
@end
