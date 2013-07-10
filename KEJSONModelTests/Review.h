//
//  Review.h
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/3/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"

@interface Review : KEJSONModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *reviewDate;
@property (nonatomic, strong) NSString *reviewerName;
@property (nonatomic, strong) NSString *reviewedDate;
@property (nonatomic, strong) NSString *reviewId;
@property (nonatomic, strong) NSString *reviewText;

@end
