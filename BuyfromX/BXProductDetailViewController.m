#import "BXProductDetailViewController.h"

@interface BXProductDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BXProductDetailViewController

- (void)viewDidLoad {
    self.nameLabel.text = self.product[@"name"];
}

@end
