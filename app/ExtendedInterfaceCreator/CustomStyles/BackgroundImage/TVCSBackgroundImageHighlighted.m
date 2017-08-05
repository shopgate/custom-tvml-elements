//
//  TVCSBackgroundImageHighlighted.m
//  SampleApp
//
//  Created by Alexander Guretzki on 05.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSBackgroundImageHighlighted.h"

@implementation TVCSBackgroundImageHighlighted

#pragma mark - TVCSBackgroundImage

+ (UIControlState)controlState
{
	return UIControlStateHighlighted;
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-background-image-highlighted";
}

@end
