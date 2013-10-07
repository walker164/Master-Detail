//
//  Master_DetailDetailViewController.m
//  Master-Detail
//
//  Created by Charles Konkol on 10/6/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "Master_DetailDetailViewController.h"

@interface Master_DetailDetailViewController ()

@end

@implementation Master_DetailDetailViewController
//Sythesize
@synthesize webview,URL,Caption,am;
#pragma mark - Managing the detail item


- (void)viewDidLoad
{
    [super viewDidLoad];
   
	// Do any additional setup after loading the view, typically from a nib.
 
}

//will load when page is visted
//check internet
-(void)viewWillAppear:(BOOL)animated
{
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        self.title = @"CIS Videos";
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        [self LoadPage];
    }
}

//load webview with YouTube video
- (void) LoadPage
{
       [self.webview setDelegate:self];
      [am startAnimating];
    self.title = Caption;
    [webview setAllowsInlineMediaPlayback:YES];
    [[self webview]loadHTMLString:URL baseURL:nil];
}
//Stop animation
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    if ([[webView stringByEvaluatingJavaScriptFromString:@"document.readyState"] isEqualToString:@"complete"]) {
        // UIWebView object has fully loaded.
        [am stopAnimating];

    }
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL) checkinternet
{
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
}
@end
