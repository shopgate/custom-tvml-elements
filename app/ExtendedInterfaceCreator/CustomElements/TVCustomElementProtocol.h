//
//  TVMLElementProtocol.h
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCustomStylesController.h"
#import <TVMLKit/TVMLKit.h>

@protocol TVCustomElementProtocol <NSObject>

+ (NSString*)name; //<name>...</name>
+ (Class)elementClass;

+ (UIView*)viewForElement:(TVViewElement*)element existingView:(UIView*)existingView;

@end
