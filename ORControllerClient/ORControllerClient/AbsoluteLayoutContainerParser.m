/*
 * OpenRemote, the Home of the Digital Home.
 * Copyright 2008-2012, OpenRemote Inc.
 *
 * See the contributors.txt file in the distribution for a
 * full listing of individual contributors.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#import "AbsoluteLayoutContainerParser.h"
#import "AbsoluteLayoutContainer.h"
#import "ORLabelParser.h"
#import "ORImageParser.h"
#import "ORWebViewParser.h"
#import "ORButtonParser.h"
#import "ORButton.h"
#import "ORSwitchParser.h"
#import "ORSwitch.h"
#import "ORSliderParser.h"
#import "ORSlider.h"
#import "ORColorPickerParser.h"
#import "DefinitionElementParserRegister.h"
#import "Definition.h"
#import "XMLEntity.h"

@interface AbsoluteLayoutContainerParser()

@property (nonatomic, strong, readwrite) LayoutContainer *layoutContainer;

@end

/**
 * AbsoluteLayoutContainer model, it stores one kind of all component models data, its frame and parsed from element absolute in panel.xml.
 * XML fragment example:
 * <absolute left="10" top="10" width="320" height="300">
 * ......
 * </absolute>
 */
@implementation AbsoluteLayoutContainerParser

- (id)initWithRegister:(DefinitionElementParserRegister *)aRegister attributes:(NSDictionary *)attributeDict
{
    self = [super initWithRegister:aRegister attributes:attributeDict];
    if (self) {
        [self addKnownTag:LABEL];
        [self addKnownTag:IMAGE];
        [self addKnownTag:WEB];
        [self addKnownTag:BUTTON];
        [self addKnownTag:SWITCH];
        [self addKnownTag:SLIDER];
        [self addKnownTag:COLORPICKER];
        self.layoutContainer = [[AbsoluteLayoutContainer alloc] initWithLeft:[[attributeDict objectForKey:@"left"] intValue]
                                                                         top:[[attributeDict objectForKey:@"top"] intValue]
                                                                       width:[[attributeDict objectForKey:@"width"] intValue]
                                                                      height:[[attributeDict objectForKey:@"height"] intValue]];
    }
    return self;
}

- (void)endLabelElement:(ORLabelParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.label;    
    [self.depRegister.definition addLabel:parser.label];
}

- (void)endImageElement:(ORImageParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.image;
    [self.depRegister.definition addImage:parser.image];
}

- (void)endWebElement:(ORWebViewParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.web;
    [self.depRegister.definition addWebView:parser.web];
}

- (void)endButtonElement:(ORButtonParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.button;
    [self.depRegister.definition addButton:parser.button];
}

- (void)endSwitchElement:(ORSwitchParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.sswitch;
    [self.depRegister.definition addSwitch:parser.sswitch];
}

- (void)endSliderElement:(ORSliderParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.slider;
    [self.depRegister.definition addSlider:parser.slider];
}

- (void)endColorPickerElement:(ORColorPickerParser *)parser
{
    ((AbsoluteLayoutContainer *)self.layoutContainer).component = parser.colorPicker;
    [self.depRegister.definition addColorPicker:parser.colorPicker];
}

@synthesize layoutContainer;

@end