#import "BXProductTableViewCell.h"

#define ROW_MARGIN 10
#define ROW_HEIGHT 200

@interface BXProductTableViewCell ()

@property (nonatomic, strong) UIButton *orderButton;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation BXProductTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        UIFont *BT_MONO_20 = [UIFont fontWithName:@"bt_mono-Regular" size:20.0f];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.priceLabel.font = BT_MONO_20;
        self.priceLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.priceLabel];
        
        self.textLabel.font = BT_MONO_20;
        
        self.orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.orderButton setTitle:NSLocalizedString(@"Order", @"Order") forState:UIControlStateNormal];
        self.orderButton.titleLabel.font = BT_MONO_20;
        [self addSubview:self.orderButton];
        
        self.separatorInset = UIEdgeInsetsZero;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat x = ROW_MARGIN;
    CGFloat y = ROW_MARGIN;
    
    CGRect cvFrame = self.contentView.frame;
    
    self.imageView.frame = CGRectMake(x, y + 1.0f, cvFrame.size.width - x * 2, 100);
    
    y += self.imageView.frame.size.height + ROW_MARGIN;
    
    [self.textLabel sizeToFit];
    self.textLabel.frame = CGRectMake(x + 2.0f, y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    y += self.textLabel.frame.size.height + ROW_MARGIN;
    
    [self.priceLabel sizeToFit];
    CGFloat priceX = x;
    self.priceLabel.frame = CGRectMake(priceX, y, self.priceLabel.frame.size.width, self.priceLabel.frame.size.height);
    
    // For adjusting based on the addition of other views
    y += 6.0f;
    
    self.orderButton.frame = CGRectMake(x, y, 80.0f, 35.0f);
}

- (void)setProduct:(PFObject *)product {
    self.imageView.file = (PFFile *)product[@"image"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView loadInBackground];
    self.textLabel.text = product[@"name"];
    NSString *currency = product[@"currency"];
    NSNumber *price = product[@"price"];
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    fmt.numberStyle = NSNumberFormatterCurrencyStyle;
    if ([currency isEqualToString:@"USD_penny"]) {
        fmt.currencyCode = @"USD";
        NSNumber *priceInUSD = @([price integerValue] / 100.0);
        self.priceLabel.text = [fmt stringFromNumber:priceInUSD];
    } else if ([currency isEqualToString:@"XBT_satoshi"]) {
        fmt.currencyCode = @"uXBT";
        fmt.currencySymbol = @"μ฿";
        NSNumber *priceInuXBT = @([price integerValue] / 100.0);
        self.priceLabel.text = [fmt stringFromNumber:priceInuXBT];
    } else {
        self.priceLabel.text = [price stringValue];
    }
}

@end
