//
//  Master_DetailMasterViewController.h
//  Master-Detail
//
//  Created by Sean Gray on 10/7/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Master_DetailMasterViewController : UITableViewController
{
    NSArray *Master;
     NSArray *Detail;
}
@property (strong, nonatomic) NSArray *Master;
@property (strong, nonatomic) NSArray *Detail;
@end
