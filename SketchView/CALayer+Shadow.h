//
//  SketchView.h
//
//
//  Created by Youngsin Park on 2022/05/13.
//  Copyright © 2025 Youngsin Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CALayer (Shadow)
/*
 스케치 쉐도우 적용
 @ date 2022.04.26
 @ author pys
 @ param width:뷰의 가로 길이
 @ return resizedImg : 리사이즈된 이미지
 */
- (void)applySketchShadow:(UIColor*)_color alpha:(CGFloat)_alpha x:(CGFloat)_x y:(CGFloat)_y blur:(CGFloat)_blur spread:(CGFloat)_spread;

@end

