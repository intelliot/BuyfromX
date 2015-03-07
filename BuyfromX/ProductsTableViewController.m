#import "ProductsTableViewController.h"
#import "BXProductTableViewCell.h"
#import <FLEX/FLEXManager.h>
#import <Parse/Parse.h>

@interface ProductsTableViewController ()

@end

@implementation ProductsTableViewController

static NSString *cellIdentifier = @"ProductCell";

- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super initWithCoder:coder])) {
        [self setup];
    }
    return self;
}

- (instancetype)init {
    if ((self = [super init])) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.title = @"Buy These Things";
    self.parseClassName = @"Product";
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.tableView registerClass:[BXProductTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.navigationItem.hidesBackButton = YES;
    self.tableView.rowHeight = 200;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"FLEX" style:UIBarButtonItemStylePlain target:self action:@selector(showExplorer:)];
}

- (void)showExplorer:(id)sender
{
    [[FLEXManager sharedManager] showExplorer];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BXProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PFObject *product = self.objects[indexPath.row];
    [cell setProduct:product];
    cell.contentView.clipsToBounds = YES;
    cell.clipsToBounds = YES;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
