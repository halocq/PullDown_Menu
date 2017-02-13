//
//  DhSharedDropButton.m
//  DunkShoe
//
//  Created by lufly on 15/12/2016.
//  Copyright © 2016 Dunkhome. All rights reserved.
//

#import "DhSharedDropButton.h"

@interface DhSharedDropButton()

@property (nonatomic) UILabel *vTitle;
@property (nonatomic) UIImageView *vArrow;
@property (nonatomic) BOOL isTouched;

@end

@implementation DhSharedDropButton

@synthesize delegate;

- (instancetype)initWithFrame:(CGRect)frame withDefaultTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    
    _isTouched = NO;
    
    _vTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, (frame.size.height - 20)/2, 0, 20)];
    _vTitle.textColor = C2;
    _vTitle.font = [UIFont systemFontOfSize:18];
    [self addSubview:_vTitle];
    
    _vArrow = [[UIImageView alloc] initWithFrame:CGRectMake(_vTitle.right, (frame.size.height - 8) / 2, 8, 8)];
    _vArrow.image = [UIImage imageNamed:@"tri_default.png"];
    [self addSubview:_vArrow];
    
    [self setTitle:title];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGr.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapGr];

    return self;
}

- (void)setTitle:(NSString *)title{
    _vTitle.text = title;
    [_vTitle sizeToFit];
    _vTitle.left = (self.width - _vTitle.width - 16)/2;
    _vArrow.left = _vTitle.right + 8;
}

- (void)viewTapped{
    [self changeArrowDirection:(_isTouched ? 4 : 2 ) animated:YES];
    _isTouched = !_isTouched;
    if (_isTouched) {
        [delegate showList];
    } else {
        [delegate hideList];
    }
}

- (void)changeArrowDirection:(int)direction animated:(BOOL)animated {
    NSTimeInterval duration = animated ? 0.25f : 0.f;
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(direction * M_PI_2);
    [UIView animateWithDuration:duration animations:^{
        _vArrow.transform = endAngle;
    }];
}

@end
