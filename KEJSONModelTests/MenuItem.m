//
//  MenuItem.m
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/3/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "MenuItem.h"
#import "Review.h"

@implementation MenuItem

+(NSDictionary *) jsonKeyToObjectPropertyNameMap {
    return @{@"id": @"itemId", @"description": @"itemDescription"};
}

-(NSString*) description {
    return [NSString stringWithFormat:@"%@ - %@", self.name, self.itemDescription];
}

#pragma mark - Keyed Archiving

-(BOOL) allowsKeyedCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.itemId forKey:@"itemId"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.spicyLevel forKey:@"spicyLevel"];
    [encoder encodeObject:self.itemDescription forKey:@"itemDescription"];
    [encoder encodeObject:self.reviewCount forKey:@"reviewCount"];
    [encoder encodeObject:self.reviews forKey:@"reviews"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.itemId = [decoder decodeObjectForKey:@"itemId"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.spicyLevel = [decoder decodeObjectForKey:@"spicyLevel"];
        self.itemDescription = [decoder decodeObjectForKey:@"itemDescription"];
        self.reviewCount = [decoder decodeObjectForKey:@"reviewCount"];
        self.reviews = [decoder decodeObjectForKey:@"reviews"];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    id theCopy = [[[self class] allocWithZone:zone] init];  // use designated initializer
    
    [theCopy setItemId:[self.itemId copy]];
    [theCopy setName:[self.name copy]];
    [theCopy setSpicyLevel:[self.spicyLevel copy]];
    [theCopy setItemDescription:[self.itemDescription copy]];
    [theCopy setReviewCount:[self.reviewCount copy]];
    [theCopy setReviews:[self.reviews copy]];
    
    return theCopy;
}

@end
