//
//  TVCSBackgroundImageDisabled.m
//  SampleApp
//
//  Created by Alexander Guretzki on 05.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSBackgroundImageDisabled.h"

@implementation TVCSBackgroundImageDisabled

#pragma mark - TVCSBackgroundImage

+ (UIControlState)controlState
{
	return UIControlStateDisabled;
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-background-image-disabled";
}

@end
