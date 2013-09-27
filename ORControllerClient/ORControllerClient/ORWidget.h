/*
 * OpenRemote, the Home of the Digital Home.
 * Copyright 2008-2013, OpenRemote Inc.
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

#import <Foundation/Foundation.h>

@class ORObjectIdentifier;

/**
 * Abstract parent class of all UI widgets model objects in OR model.
 * 
 * Provides management of the identifier property that all widgets have.
 */
@interface ORWidget : NSObject

/**
 * Initializes the widget with the given identifier.
 *
 * @param anIdentifier ORObjectIdenfitier to use as identifier for this widget
 *
 * @return An ORWidget object initialized with the provided identifier.
 */
- (id)initWithIdentifier:(ORObjectIdentifier *)anIdentifier;

/**
 * Widget identifier.
 */
@property (nonatomic, strong, readonly) ORObjectIdentifier *identifier;

@end