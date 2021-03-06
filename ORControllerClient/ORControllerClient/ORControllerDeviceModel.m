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

#import "ORControllerDeviceModel.h"
#import "ORDevice.h"
#import "ORObjectIdentifier.h"


@interface ORControllerDeviceModel ()

@property (nonatomic, strong, readwrite) NSArray *devices;

@end

@implementation ORControllerDeviceModel

static NSString * const kDeviceKey = @"Devices";

- (instancetype)initWithDevices:(NSArray *)devices
{
    self = [super init];
    if (self) {
        self.devices = devices;
    }
    return self;
}

- (ORDevice *)findDeviceById:(ORObjectIdentifier *)id
{
    for (ORDevice *device in self.devices) {
        if ([device.identifier isEqual:id]) {
            return device;
        }
    }
    return nil;
}

- (ORDevice *)findDeviceByName:(NSString *)name
{
    for (ORDevice *device in self.devices) {
        if ([device.name isEqualToString:name]) {
            return device;
        }
    }
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.devices forKey:kDeviceKey];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    return [self initWithDevices:[coder decodeObjectForKey:kDeviceKey]];
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToModel:other];
}

- (BOOL)isEqualToModel:(ORControllerDeviceModel *)model
{
    if (self == model)
        return YES;
    if (model == nil)
        return NO;
    if (self.devices != model.devices && ![self.devices isEqualToArray:model.devices])
        return NO;
    return YES;
}

- (NSUInteger)hash
{
    return [self.devices hash];
}

@end
