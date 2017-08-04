//
//  TVCEButton.m
//  SampleApp
//
//  Created by Alexander Guretzki on 23.07.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCEButton.h"

@implementation TVCEButton

#pragma mark - Privates

+ (Class)TVCE_existingViewClass
{
	return [UIButton class];
}

#pragma mark TVCustomElementProtocol

+ (NSString*)name
{
	return @"tvce-button";
}

+ (Class)elementClass
{
	return [TVTextElement class];
}

+ (UIView*)viewForElement:(TVViewElement*)element existingView:(UIView*)existingView
{
	if ([element isKindOfClass:[self elementClass]] == NO || (existingView != nil && [existingView isKindOfClass:[self TVCE_existingViewClass]] == NO))
		return nil;
	
	TVTextElement* textElement = (TVTextElement*)element;
	
	TVViewElementStyle* style = textElement.style;
	
	UIButton* button = (UIButton*)existingView;
	if (button == nil)
		button = [UIButton buttonWithType:UIButtonTypeSystem];
	
	[button setAttributedTitle:textElement.attributedText forState:UIControlStateNormal];
	
	[TVCustomStylesController applyCustomStyle:style toView:button];
	
	if (style.backgroundColor.color)
		button.backgroundColor = style.backgroundColor.color;
	
	if (textElement.style.width && textElement.style.height)
		button.frame = CGRectMake(0, 0, style.width, style.height);
	
	return button;
	
}

@end
