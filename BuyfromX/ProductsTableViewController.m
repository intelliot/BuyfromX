#import "ProductsTableViewController.h"
#import "BXProductTableViewCell.h"
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
    self.parseClassName = @"Product";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    [self.tableView registerClass:[BXProductTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.navigationItem.hidesBackButton = YES;
    self.tableView.rowHeight = 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BXProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PFObject *product = self.objects[indexPath.row];
    [cell setProduct:product];
    return cell;
}

@end
