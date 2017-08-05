//
//  TVCSSTextDecoration.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCSTextDecoration.h"

@implementation TVCSTextDecoration

#pragma mark - Privates

+ (NSAttributedString*)TVCS_attributedStringByApplyingStyle:(TVViewElementStyle*)style styleValue:(NSString*)styleValue toAttributedString:(NSAttributedString*)attributedString
{
	NSMutableAttributedString* styledAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
	
	NSRange stringRange = NSMakeRange(0, styledAttributedString.length);
	
	if([styleValue isEqualToString:@"line-through"])
		[styledAttributedString addAttribute:NSStrikethroughStyleAttributeName value:@1 range:stringRange];
	else if([styleValue isEqualToString:@"underline"])
		[styledAttributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:stringRange];
	
	return [styledAttributedString copy];
}

+ (NSArray*)TVCS_allowedValues
{
	return @[@"line-through", @"underline"];
}

#pragma mark TVCustomStyleProtocol

+ (NSString*)name
{
    return @"tvcs-text-decoration";
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
