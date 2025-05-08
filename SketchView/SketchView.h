//
//  SketchView.h
//
//
//  Created by Youngsin Park on 2022/05/13.
//  Copyright © 2025 Youngsin Park. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface SketchView : UIView

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGFloat shadowAlpha;
@property (nonatomic, assign) CGFloat shadowX;
@property (nonatomic, assign) CGFloat shadowY;
@property (nonatomic, assign) CGFloat shadowBlur;
@property (nonatomic, assign) CGFloat shadowSpread;

@end

