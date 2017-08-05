//
//  TVCEButton.m
//  SampleApp
//
//  Created by Alexander Guretzki on 23.07.17.
//  Copyright © 2017 Goergisn. All rights reserved.
//

#import "TVCEButton.h"

@interface CustomButton : UIButton

@property (nonatomic) BOOL sizesBasedOnContent;

@end

@implementation CustomButton

#pragma mark - UIButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
	return self.bounds;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
	// Making the imageView behave like backgroundImage
	// So we get the contentMode behavior for free
	
	return self.bounds;
}

#pragma mark - UIView

- (CGSize)sizeThatFits:(CGSize)size
{
	if(self.sizesBasedOnContent == YES)
		return [super sizeThatFits:size];
	
	// Making sure that the button doesn't scale itself based on the content
	return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

@end

#pragma mark -

@implementation TVCEButton

#pragma mark - Privates

+ (Class)TVCE_existingViewClass
{
	return [AwesomeButton class];
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
	if([element isKindOfClass:[self elementClass]] == NO || (existingView != nil && [existingView isKindOfClass:[self TVCE_existingViewClass]] == NO))
		return nil;
	
	TVTextElement* textElement = (TVTextElement*)element;
	
	TVViewElementStyle* style = textElement.style;
	
	CustomButton* button = (CustomButton*)existingView;
	if(button == nil)
		button = [CustomButton buttonWithType:UIButtonTypeSystem];
	
	[button setAttributedTitle:textElement.attributedText forState:UIControlStateNormal];
	
	[TVCustomStylesController applyCustomStyle:style toView:button];
	
	button.enabled = (element.isDisabled == NO);
	
	if(element.attributes[@"accessibilityText"] != nil)
		button.accessibilityLabel = element.attributes[@"accessibilityText"];
	
	if(style.backgroundColor.color)
		button.backgroundColor = style.backgroundColor.color;
	
	if(textElement.style.width > 0 && textElement.style.height > 0)
	{
		button.sizesBasedOnContent = NO;
		button.frame = CGRectMake(0, 0, style.width, style.height);
	}
	else
	{
		button.sizesBasedOnContent = YES;
		
		if(style.width > 0)
			button.bounds = CGRectMake(0, 0, style.width, [button sizeThatFits:CGSizeMake(style.width, CGFLOAT_MAX)].height);
		else if(style.height > 0)
			button.bounds = CGRectMake(0, 0, [button sizeThatFits:CGSizeMake(CGFLOAT_MAX, style.height)].width, style.height);
		else
			[button sizeToFit];
	}
	
	return button;
	
}

@end
