//
//  TVCSBackgroundImage.h
//  SampleApp
//
//  Created by Alexander Guretzki on 04.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TVCustomStyleProtocol.h"

@interface TVCSBackgroundImage : NSObject <TVCustomStyleProtocol>

@property (class, nonatomic, readonly) UIControlState controlState;

@end
