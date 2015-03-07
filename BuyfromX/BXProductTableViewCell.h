#import "PFTableViewCell.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface BXProductTableViewCell : PFTableViewCell

- (void)setProduct:(PFObject *)product;

@end
