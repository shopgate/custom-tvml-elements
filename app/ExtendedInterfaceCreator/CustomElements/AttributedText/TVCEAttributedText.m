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
    if ([element isKindOfClass:[self elementClass]] == NO || (existingView != nil && [existingView isKindOfClass:[self TVCE_existingViewClass]] == NO))
        return nil;
    
    TVTextElement* textElement = (TVTextElement*)element;
    
    TVViewElementStyle* style = textElement.style;
    
    UILabel* attributedLabel = (UILabel*)existingView;
    if(attributedLabel == nil)
        attributedLabel = [UILabel new];
    
    attributedLabel.attributedText = textElement.attributedText;
    
    [TVCustomStylesController applyCustomStyle:style toView:attributedLabel];
    
    if (style.backgroundColor.color)
        attributedLabel.backgroundColor = style.backgroundColor.color;
	
	if (textElement.style.width && textElement.style.height)
		attributedLabel.frame = CGRectMake(0, 0, style.width, style.height);
	
    return attributedLabel;

}

@end
