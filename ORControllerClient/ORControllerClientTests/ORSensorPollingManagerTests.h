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

#import <XCTest/XCTest.h>

@interface ORSensorPollingManagerTests : XCTestCase

/*
 * Test that when starting the poll manager:
 * - the status request method is called once
 * - in case of success, the poll method is called repeatedly
 *
 TODO: assert that appropriate sensor id is passed as parameter to call
 */
- (void)testAppropriateAPIMethodsCalledOnStart;

// TODO: Should also test that when calling stop, the poll method is not called again

@end
