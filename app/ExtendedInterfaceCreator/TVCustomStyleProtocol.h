//
//  TVCSSProtocol.h
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#ifndef TVCustomStyleProtocol_h
#define TVCustomStyleProtocol_h

#import <TVMLKit/TVMLKit.h>

@protocol TVCustomStyleProtocol <NSObject>

@required
+ (NSString *)name;
+ (TVViewElementStyleType)styleType;

+ (void)applyStyle:(TVViewElementStyle *)style toView:(UIView *)view;

@end

#endif /* TVCustomStyleProtocol_h */
