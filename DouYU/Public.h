//
//  Public.h
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#ifndef Public_h
#define Public_h

// 相对iphone6 的屏幕比
#define KWidth_Scale [UIScreen mainScreen].bounds.size.width/375.0f


#define TabBar_T_Color RGB(244, 89, 27)

// RGB
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)     RGBA(r, g, b, 1.0f)

// 设置物理尺寸
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#endif /* Public_h */
