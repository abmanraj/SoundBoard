//
//  MVYMenuViewController.m
//  MVYSideMenuExample
//
//  Created by Álvaro Murillo del Puerto on 10/07/13.
//  Copyright (c) 2013 Mobivery. All rights reserved.
//

#import "MVYMenuViewController.h"
#import "MVYSideMenuController.h"


@interface MVYMenuViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation MVYMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MenuCell"];
	self.menuItems = @[@"Menu Item 1", @"Menu Item 2", @"Menu Item 3", @"Menu Item 4", @"Menu Item 5"];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    //2.create an UIImageView that you want to appear behind the table
    UIImageView *tableBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"high-quality-wallpaper-4-610x381.jpg"]];
    
    //3.set the UIImageView’s frame to the same size of the tableView
    [tableBackgroundView setFrame: self.tableView.frame];
    
    //4.update tableView’s backgroundImage to the new UIImageView object
    [self.tableView setBackgroundView:tableBackgroundView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"MenuCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor blackColor];
	NSString *item = [self.menuItems objectAtIndex:indexPath.row];
	[cell.textLabel setText:item];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell.textLabel setHighlightedTextColor:[UIColor redColor]];
	return cell;
}

#pragma mark – UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
//	MVYContentViewController *contentVC = [[MVYContentViewController alloc] initWithNibName:@"MVYContentViewController" bundle:nil];
//	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:contentVC];
//	[[self sideMenuController] changeContentViewController:navigationController closeMenu:YES];
}



@end
