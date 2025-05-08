//
//  SketchView.h
//
//
//  Created by Youngsin Park on 2022/05/13.
//  Copyright © 2025 Youngsin Park. All rights reserved.
//

#import "CALayer+Shadow.h"

@implementation CALayer (Shadow)

- (void)applySketchShadow:(UIColor*)_color alpha:(CGFloat)_alpha x:(CGFloat)_x y:(CGFloat)_y blur:(CGFloat)_blur spread:(CGFloat)_spread
{
    if (![_color isKindOfClass:[UIColor class]]) {
            NSLog(@"[applySketchShadow] Error: _color is not UIColor, but %@", NSStringFromClass([_color class]));
        return;
    }
    
    self.shadowColor = _color.CGColor;
    self.shadowOpacity = _alpha;
    self.shadowOffset = CGSizeMake(_x, _y);
    self.shadowRadius = _blur / 2.0;
    if (_spread == 0){
        self.shadowPath = nil;
    } else {
        CGFloat dx = -(_spread);
        CGRect rect = CGRectInset(self.bounds, dx, dx);
        self.shadowPath = [UIBezierPath bezierPathWithRect:rect].CGPath;
    }
}


@end
