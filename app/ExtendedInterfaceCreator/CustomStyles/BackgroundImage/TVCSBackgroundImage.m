//
//  TVCSBackgroundImage.m
//  SampleApp
//
//  Created by Alexander Guretzki on 04.08.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCSBackgroundImage.h"

#import "UIImage+animatedGIF.h"

@implementation TVCSBackgroundImage

+ (UIControlState)controlState
{
	return UIControlStateNormal;
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-background-image";
}

+ (TVViewElementStyleType)styleType
{
	return TVViewElementStyleTypeString;
}

+ (void)applyStyle:(TVViewElementStyle*)style toView:(UIView*)view
{
	NSString* styleValue = [style valueForStyleProperty:[self name]];
	
	if(styleValue == nil)
		return;
	
	if([view isKindOfClass:[UIButton class]] == YES)
		[(UIButton*)view setImage:[UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:styleValue]] forState:[self controlState]];
}

@end
