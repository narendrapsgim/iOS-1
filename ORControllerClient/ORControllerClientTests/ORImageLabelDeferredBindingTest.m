/*
 * OpenRemote, the Home of the Digital Home.
 * Copyright 2008-2014, OpenRemote Inc.
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
#import "ORImageLabelDeferredBindingTest.h"
#import "ORImageLabelDeferredBinding.h"
#import "ORModelObject_Private.h"
#import "ORObjectIdentifier.h"
#import "ORImage_Private.h"
#import "ORLabel_Private.h"
#import "Definition.h"

@implementation ORImageLabelDeferredBindingTest

- (void)testCreateValidBinding
{
    ORObjectIdentifier *identifier = [[ORObjectIdentifier alloc] initWithIntegerId:1];
    ORImage *image = [[ORImage alloc] initWithIdentifier:[[ORObjectIdentifier alloc] initWithIntegerId:2] src:@""];
    ORDeferredBinding *binding = [[ORImageLabelDeferredBinding alloc] initWithBoundComponentIdentifier:identifier enclosingObject:image];
    XCTAssertNotNil(binding, @"Creating a deferred binding should be possible");
    XCTAssertEqualObjects(binding.boundComponentId, identifier, @"Bound component identifier should be one used to create binding");
    XCTAssertEqualObjects(binding.enclosingObject, image, @"Enclosing object should be one used to create binding");
}

- (void)testFailCreateBindingWithIncorrectEnclosingObjectClass
{
    ORObjectIdentifier *identifier = [[ORObjectIdentifier alloc] initWithIntegerId:1];
    ORLabel *label = [[ORLabel alloc] initWithIdentifier:[[ORObjectIdentifier alloc] initWithIntegerId:2] text:@""];
    ORDeferredBinding *binding = [[ORImageLabelDeferredBinding alloc] initWithBoundComponentIdentifier:identifier enclosingObject:label];
    XCTAssertNil(binding, @"It should not be possible to create an ORImageLabelDeferredBinding with an enclosing object that is not an image");
}

- (void)testBindingIsEstablished
{
    Definition *definition = [[Definition alloc] init];
    ORObjectIdentifier *identifier = [[ORObjectIdentifier alloc] initWithIntegerId:1];
    ORImage *image = [[ORImage alloc] initWithIdentifier:[[ORObjectIdentifier alloc] initWithIntegerId:2] src:@""];
    image.definition = definition;
    ORDeferredBinding *binding = [[ORImageLabelDeferredBinding alloc] initWithBoundComponentIdentifier:identifier enclosingObject:image];

    ORLabel *label = [[ORLabel alloc] initWithIdentifier:identifier text:@"Test label"];
    label.definition = definition;
    [definition addLabel:label];

    [binding bind];
    XCTAssertEqualObjects(image.label, label, @"Binding should have set label link on image");
}

@end