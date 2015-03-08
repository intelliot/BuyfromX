#import "BXProductDetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <Braintree/Braintree.h>

@interface BXProductDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation BXProductDetailViewController

- (void)viewDidLoad {
    self.nameLabel.text = self.product[@"name"];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"https://your-server/client_token.json"
//      parameters:@{ @"your-server-authentication": @"token", @"your-customer-session": @"session"}
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             // Setup braintree with responseObject[@"client_token"]
//             self.braintree = [Braintree braintreeWithClientToken:responseObject[@"client_token"]];
//         }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             // Handle failure communicating with your server
//         }];
}

@end
