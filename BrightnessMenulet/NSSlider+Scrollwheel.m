// Based on https://github.com/yene/DisplayBrightness

#import "NSSlider+Scrollwheel.h"

@implementation NSSlider (Scrollwheel)

- (void)scrollWheel:(NSEvent*)event {
	float range = [self maxValue] - [self minValue];
	float increment = (range * [event deltaY]) / 100;
	float val = [self floatValue] + increment;
	
	BOOL wrapValue = ([[self cell] sliderType] == NSCircularSlider);
	
	if (wrapValue) {
		if (val < [self minValue]) {
			val = [self maxValue] - fabs(increment);
		}
		
		if( val > [self maxValue]) {
			val = [self minValue] + fabs(increment);
		}
	}
	
	[self setFloatValue:val];
	[self sendAction:[self action] to:[self target]];
}

@end
