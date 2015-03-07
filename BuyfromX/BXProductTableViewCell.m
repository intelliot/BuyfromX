#import "BXProductTableViewCell.h"

#define ROW_MARGIN 6.0f
#define ROW_HEIGHT 200

@interface BXProductTableViewCell ()

@property (nonatomic, strong) UIButton *orderButton;
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation BXProductTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.priceLabel.font = [UIFont fontWithName:@"bt_mono-Regular" size:20.0f];
        self.priceLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.priceLabel];
        
        self.orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.orderButton setTitle:NSLocalizedString(@"Order", @"Order") forState:UIControlStateNormal];
        self.orderButton.titleLabel.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
        self.orderButton.titleLabel.shadowOffset = CGSizeMake(0.0f, -0.5f);
        self.orderButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0f];
        
        UIImage *orderImage = [UIImage imageNamed:@"ButtonOrder.png"];
        UIImage *orderPressedImage = [UIImage imageNamed:@"ButtonOrderPressed.png"];
        UIEdgeInsets insets = UIEdgeInsetsMake(orderImage.size.height/2, orderImage.size.width/2, orderImage.size.height/2, orderImage.size.width/2);
        [self.orderButton setBackgroundImage:[orderImage resizableImageWithCapInsets:insets] forState:UIControlStateNormal];
        [self.orderButton setBackgroundImage:[orderPressedImage resizableImageWithCapInsets:insets] forState:UIControlStateHighlighted];
        [self addSubview:self.orderButton];
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat x = ROW_MARGIN;
    CGFloat y = ROW_MARGIN;
    self.backgroundView.frame = CGRectMake(x, y, self.frame.size.width - ROW_MARGIN*2.0f, 167.0f);
    x += 10.0f;
    
    self.imageView.frame = CGRectMake(x, y + 1.0f, 120.0f, 165.0f);
    x += 120.0f + 5.0f;
    y += 10.0f;
    
    [self.priceLabel sizeToFit];
    CGFloat priceX = self.frame.size.width - self.priceLabel.frame.size.width - ROW_MARGIN - 10.0f;
    self.priceLabel.frame = CGRectMake(priceX, ROW_MARGIN + 10.0f, self.priceLabel.frame.size.width, self.priceLabel.frame.size.height);
    
    [self.textLabel sizeToFit];
    self.textLabel.frame = CGRectMake(x + 2.0f, y, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    y += self.textLabel.frame.size.height + 2.0f;
    
    // For adjusting based on the addition of other views
    y += 6.0f;
    
    self.orderButton.frame = CGRectMake(x, y, 80.0f, 35.0f);
}

- (void)setProduct:(PFObject *)product {
    self.imageView.file = (PFFile *)product[@"image"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView loadInBackground];
    
    self.priceLabel.text = [product[@"price"] stringValue];
}

@end
