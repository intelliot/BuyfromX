#import "BXInitialViewController.h"
#import "ProductsTableViewController.h"

@implementation BXInitialViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ProductsTableViewController *tableViewController = [[ProductsTableViewController alloc] init];
    [self.navigationController pushViewController:tableViewController animated:NO];
//    [self presentViewController:tableViewController animated:NO completion:nil];
}

@end
