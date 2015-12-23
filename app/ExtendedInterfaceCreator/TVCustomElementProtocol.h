//
//  TVMLElementProtocol.h
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#ifndef TVMLElementProtocol_h
#define TVMLElementProtocol_h

#import "TVCustomStylesController.h"
#import <TVMLKit/TVMLKit.h>

@protocol TVCustomElementProtocol <NSObject>

@required
+ (NSString *)name;
+ (Class)elementClass;

+ (UIView *)viewForElement:(TVViewElement *)element existingView:(UIView *)existingView;

@end

#endif /* TVMLElementProtocol_h */
