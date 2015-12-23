//
//  StyleLoader.h
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TVCustomStyleProtocol.h"

//Import the Custom Style Classes
#import "TVCSTextDecoration.h"
#import "TVCSFont.h"

@interface TVCustomStylesController : NSObject

+ (void)registerStyles;
+ (void)applyCustomStyle:(TVViewElementStyle *)style toView:(UIView *)view;

@end
