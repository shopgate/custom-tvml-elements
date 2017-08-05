//
//  StyleLoader.h
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TVCustomStyleProtocol.h"

#import "TVCSBackgroundImage.h"
#import "TVCSBackgroundImageDisabled.h"
#import "TVCSBackgroundImageFocused.h"
#import "TVCSBackgroundImageHighlighted.h"
#import "TVCSBackgroundImageSelected.h"
#import "TVCSContentMode.h"
#import "TVCSFont.h"
#import "TVCSTextDecoration.h"

@interface TVCustomStylesController : NSObject

+ (void)registerStyles;
+ (void)applyCustomStyle:(TVViewElementStyle*)style toView:(UIView*)view;

@end
