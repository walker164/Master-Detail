//
//  Master_DetailDetailViewController.h
//  Master-Detail
//
//  Created by Charles Konkol on 10/6/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Master_DetailDetailViewController : UIViewController <UIWebViewDelegate>
{
    //1) Add Default initializers
    NSString *URL;
    NSString *Caption;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *am;

//2) Modify.
//This will get rid of error on MasterViewConrtoller:
//- (void)prepareForSegue:


@property (strong, nonatomic) NSString *URL;
@property (strong, nonatomic) NSString *Caption;

@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
