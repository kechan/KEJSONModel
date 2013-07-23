//
//  Review.m
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/3/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "Review.h"

@implementation Review

#pragma mark - JSON Key & Object Property Name Remapping

+(NSDictionary *) jsonKeyToObjectPropertyNameMap {
    return @{@"id": @"reviewId"};
}

#pragma mark - Keyed Archiving

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.rating forKey:@"Rating"];
    [encoder encodeObject:self.reviewerName forKey:@"ReviewerName"];
    [encoder encodeObject:self.reviewId forKey:@"ReviewId"];
    [encoder encodeObject:self.reviewText forKey:@"ReviewText"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        if ([decoder containsValueForKey:@"Rating"])
            self.rating = [decoder decodeObjectForKey:@"Rating"];
        if ([decoder containsValueForKey:@"ReviewerName"])
            self.reviewerName = [decoder decodeObjectForKey:@"ReviewerName"];
        if ([decoder containsValueForKey:@"ReviewId"])
            self.reviewId = [decoder decodeObjectForKey:@"ReviewId"];
        if ([decoder containsValueForKey:@"ReviewText"])
            self.reviewText = [decoder decodeObjectForKey:@"ReviewText"];
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone
{
    id theCopy = [[[self class] allocWithZone:zone] init];  // use designated initializer
    
    [theCopy setRating:[self.rating copy]];
    [theCopy setReviewerName:[self.reviewerName copy]];
    [theCopy setReviewId:[self.reviewId copy]];
    [theCopy setReviewText:[self.reviewText copy]];
    
    return theCopy;
}

@end
