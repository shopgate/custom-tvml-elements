//
//  TVCSSFont.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCSFont.h"

@implementation TVCSFont

#pragma mark - Privates

+ (NSAttributedString*)TVCS_attributedStringByApplyingStyle:(TVViewElementStyle*)style styleValue:(NSString*)styleValue toAttributedString:(NSAttributedString*)attributedString
{
	NSMutableAttributedString* styledAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
	NSRange stringRange = NSMakeRange(0, styledAttributedString.length);
	
	CGFloat fontSize = (style.fontSize ? style.fontSize : 11);
	UIFont* font = [UIFont fontWithName:styleValue size:fontSize];
	[styledAttributedString addAttribute:NSFontAttributeName value:font range:stringRange];
	
	return [styledAttributedString copy];
}

+ (NSArray*)TVCS_allowedValues
{
	return [UIFont familyNames];
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
	return @"tvcs-font";
}

+ (TVViewElementStyleType)styleType
{
	return TVViewElementStyleTypeString;
}

+ (void)applyStyle:(TVViewElementStyle*)style toView:(UIView*)view
{
	NSString* styleValue = [style valueForStyleProperty:[self name]];
	
	if(styleValue == nil || [[self TVCS_allowedValues] containsObject:styleValue] == NO)
		return;
	
	if([view isKindOfClass:[UIButton class]] == YES)
	{
		UIButton* button = (UIButton*)view;
		NSAttributedString* attributedButtonTitle = [button attributedTitleForState:UIControlStateNormal];
		[button setAttributedTitle:[self TVCS_attributedStringByApplyingStyle:style styleValue:styleValue toAttributedString:attributedButtonTitle]
						  forState:UIControlStateNormal];
	}
	else if([view isKindOfClass:[UILabel class]] == YES)
	{
		UILabel* label = (UILabel*)view;
		label.attributedText = [self TVCS_attributedStringByApplyingStyle:style styleValue:styleValue toAttributedString:label.attributedText];
	}
}

@end
