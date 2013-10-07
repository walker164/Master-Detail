//
//  Master_DetailMasterViewController.m
//  Master-Detail
//
//  Created by Charles Konkol on 10/6/13.
//  Copyright (c) 2013 Chuck Konkol. All rights reserved.
//

#import "Master_DetailMasterViewController.h"

#import "Master_DetailDetailViewController.h"

@interface Master_DetailMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation Master_DetailMasterViewController
@synthesize Master,Detail;
NSString *mycis,*cisapps,*cisco;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

//Loads each time page is visited
//Checks if internet is connected
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
//Check Internet
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
//Load Page
- (void) LoadPage
{
    self.title = @"CIS Videos";
    NSArray *MasterArray = [[NSArray alloc] initWithObjects:@"MYCIS", @"CIS APPS", @"CISCO",nil];
    self.Master = MasterArray;
    //Check if iPad or iPhone
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self setupMainView_iPhone];
    }
    else {
        [self setupMainView_iPad];
    }
}
//If iphone
- (void) setupMainView_iPhone
{

   mycis = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    
   cisapps = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    
    cisco = @"<iframe webkit-playsinline width=\"680\" height=\"383\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
    NSArray *DetailArray = [[NSArray alloc] initWithObjects:mycis, cisapps, cisco,nil];
    self.Detail = DetailArray;
    
}


//If iPad
- (void) setupMainView_iPad
{

    mycis = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/mlMiQONvxCA?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
   
    
   cisapps = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/j-vcZqTWKuc?feature=player_detailpage\"  frameborder=\"0\" allowfullscreen></iframe>";
  
    
   cisco = @"<iframe webkit-playsinline width=\"960\" height=\"720\" src=\"http://www.youtube.com/embed/7XeYggGAxj0?feature=player_detailpage\" frameborder=\"0\" allowfullscreen></iframe>";
   
    NSArray *DetailArray = [[NSArray alloc] initWithObjects:mycis, cisapps, cisco,nil];
    self.Detail = DetailArray;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Master count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [Master objectAtIndex:[indexPath row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setURL:[Detail objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
    
    [segue.destinationViewController setCaption:[Master objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
}

@end
