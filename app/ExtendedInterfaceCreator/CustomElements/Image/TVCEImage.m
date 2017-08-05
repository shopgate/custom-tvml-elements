//
//  TVCEImage.m
//  SampleApp
//
//  Created by Alex Goergisn on 24.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCEImage.h"
#import "UIImage+animatedGIF.h"

@implementation TVCEImage

#pragma mark - Privates

+ (Class)TVCE_existingViewClass
{
	return [UIImageView class];
}

#pragma mark TVCustomElementProtocol

+ (NSString*)name
{
    return @"tvce-image";
}

+ (Class)elementClass
{
    return [TVImageElement class];
}

+ (UIView*)viewForElement:(TVViewElement*)element existingView:(UIView*)existingView
{
	if([element isKindOfClass:[self elementClass]] == NO || (existingView != nil && [existingView isKindOfClass:[self TVCE_existingViewClass]] == NO))
		return nil;
	
    TVImageElement* imageElement = (TVImageElement*)element;
    
    TVViewElementStyle* style = element.style;
    
    UIImageView* imageView = (UIImageView*)existingView;
    if(imageView == nil)
	{
        imageView = [UIImageView new];
		imageView.clipsToBounds = YES;
    }
    
    //Does not have to be an animated gif url
    imageView.image = [UIImage animatedImageWithAnimatedGIFURL:imageElement.URL];
    
    [TVCustomStylesController applyCustomStyle:style toView:imageView];
    
    if(style.backgroundColor.color)
        imageView.backgroundColor = style.backgroundColor.color;
	
	if(style.width > 0 && style.height > 0)
		imageView.bounds = CGRectMake(0, 0, style.width, style.height);
	else if(style.width > 0)
		imageView.bounds = CGRectMake(0, 0, style.width, [imageView sizeThatFits:CGSizeMake(style.width, CGFLOAT_MAX)].height);
	else if(style.height > 0)
		imageView.bounds = CGRectMake(0, 0, [imageView sizeThatFits:CGSizeMake(CGFLOAT_MAX, style.height)].width, style.height);
	else
		[imageView sizeToFit];
	
    return imageView;
    
}


@end
