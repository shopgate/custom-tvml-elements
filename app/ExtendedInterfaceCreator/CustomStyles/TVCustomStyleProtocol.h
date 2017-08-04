//
//  TVCSSProtocol.h
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import <TVMLKit/TVMLKit.h>

@protocol TVCustomStyleProtocol <NSObject>

+ (NSString*)name; // <... style="name: ...;">...</...>
+ (TVViewElementStyleType)styleType;

+ (void)applyStyle:(TVViewElementStyle*)style toView:(UIView*)view;

@end
