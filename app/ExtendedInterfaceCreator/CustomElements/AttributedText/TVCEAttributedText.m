//
//  AttributedTextLabel.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCEAttributedText.h"

@implementation TVCEAttributedText

#pragma mark - Privates

+ (Class)TVCE_existingViewClass
{
	return [UILabel class];
}

#pragma mark TVCustomElementProtocol

+ (NSString*)name
{
    return @"tvce-attributedText";
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
    
    UILabel* attributedLabel = (UILabel*)existingView;
    if(attributedLabel == nil)
        attributedLabel = [UILabel new];
    
    attributedLabel.attributedText = textElement.attributedText;
    
    [TVCustomStylesController applyCustomStyle:style toView:attributedLabel];
    
    if(style.backgroundColor.color)
        attributedLabel.backgroundColor = style.backgroundColor.color;
	
	attributedLabel.textAlignment = style.textAlignment;
	
	if(style.width > 0 && style.height > 0)
		attributedLabel.bounds = CGRectMake(0, 0, style.width, style.height);
	else if(style.width > 0)
		attributedLabel.bounds = CGRectMake(0, 0, style.width, [attributedLabel sizeThatFits:CGSizeMake(style.width, CGFLOAT_MAX)].height);
	else if(style.height > 0)
		attributedLabel.bounds = CGRectMake(0, 0, [attributedLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, style.height)].width, style.height);
	else
		[attributedLabel sizeToFit];
	
    return attributedLabel;

}

@end
