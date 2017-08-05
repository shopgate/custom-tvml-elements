//
//  TVCSBackgroundImageSelected.m
//  SampleApp
//
//  Created by Alexander Guretzki on 05.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSBackgroundImageSelected.h"

@implementation TVCSBackgroundImageSelected

#pragma mark - TVCSBackgroundImage

+ (UIControlState)controlState
{
	return UIControlStateSelected;
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-background-image-selected";
}

@end
