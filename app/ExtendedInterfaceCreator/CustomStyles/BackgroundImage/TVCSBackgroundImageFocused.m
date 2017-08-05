//
//  TVCSBackgroundImageFocused.m
//  SampleApp
//
//  Created by Alexander Guretzki on 05.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSBackgroundImageFocused.h"

@implementation TVCSBackgroundImageFocused

#pragma mark - TVCSBackgroundImage

+ (UIControlState)controlState
{
	return UIControlStateFocused;
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-background-image-focused";
}

@end
