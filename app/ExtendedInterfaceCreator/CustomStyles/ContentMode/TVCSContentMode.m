//
//  TVCSContentMode.m
//  SampleApp
//
//  Created by Alexander Guretzki on 05.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSContentMode.h"

@implementation TVCSContentMode

#pragma mark - Privates

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-content-mode";
}

+ (TVViewElementStyleType)styleType
{
	return TVViewElementStyleTypeString;
}

+ (UIViewContentMode)TVCS_contentModeFromStyleValue:(NSString*)styleValue
{
	if([styleValue isEqualToString:@"fit"] == YES)
		return UIViewContentModeScaleAspectFit;
	else if([styleValue isEqualToString:@"fill"] == YES)
		return UIViewContentModeScaleAspectFill;
	else
		return UIViewContentModeScaleToFill;
}

+ (void)applyStyle:(TVViewElementStyle*)style toView:(UIView*)view
{
	NSString* styleValue = [style valueForStyleProperty:[self name]];
	
	if(styleValue == nil)
		return;
	
	UIImageView* imageView = (UIImageView*)view;
	
	if([view isKindOfClass:[UIButton class]] == YES)
		imageView = ((UIButton*)view).imageView;
	
	if([imageView isKindOfClass:[UIImageView class]] == YES)
		imageView.contentMode = [self TVCS_contentModeFromStyleValue:styleValue];
}

@end
