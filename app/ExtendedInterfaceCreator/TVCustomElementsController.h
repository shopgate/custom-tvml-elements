//
//  ElementLoader.h
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TVCustomElementProtocol.h"

//Import the Custom Element Classes
#import "TVCEAttributedText.h"
#import "TVCEImage.h"

@interface TVCustomElementsController : NSObject

+ (void)registerElements;
+ (UIView *)viewForElement:(TVViewElement *)element existingView:(UIView *)existingView;

@end
