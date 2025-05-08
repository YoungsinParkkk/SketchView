//
//  SketchView.h
//
//
//  Created by Youngsin Park on 2022/05/13.
//  Copyright © 2025 Youngsin Park. All rights reserved.
//

#import "SketchView.h"
#import "CALayer+Shadow.h"

@interface SketchView ()
@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation SketchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    // ✅ shadowView 먼저 생성
    self.shadowView = [[UIView alloc] initWithFrame:CGRectZero];
    self.shadowView.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
    self.shadowView.clipsToBounds = NO;
    [self addSubview:self.shadowView];

    // ✅ contentView 생성
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.clipsToBounds = YES; // 내부 잘라주기
    [self.shadowView addSubview:self.contentView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (!self.shadowView || !self.contentView) {
        return;
    }
    if (!self.shadowView.layer) {
        return;
    }

    self.shadowView.frame = self.bounds;
    self.contentView.frame = self.shadowView.bounds;
    
    // Shadow 적용 (shadowView.layer에)
    [self.shadowView.layer applySketchShadow:self.shadowColor
                                       alpha:self.shadowAlpha
                                           x:self.shadowX
                                           y:self.shadowY
                                        blur:self.shadowBlur
                                      spread:self.shadowSpread];

    // CornerRadius 적용 (contentView에만)
    self.contentView.layer.cornerRadius = self.cornerRadius;
    
    // shadowView는 항상 맨 아래
    if ([self.subviews containsObject:self.shadowView]) {
        [self insertSubview:self.shadowView atIndex:0];
    }

    // contentView는 항상 shadowView 위
    if ([self.subviews containsObject:self.contentView]) {
        [self insertSubview:self.contentView atIndex:1];
    }
    
}

//  border 설정 (shadowView.layer에 적용)
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.contentView.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.contentView.layer.borderWidth = borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    if (self.contentView) {
        self.contentView.layer.cornerRadius = cornerRadius;
    }
}

@end
