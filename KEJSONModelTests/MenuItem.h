//
//  MenuItem.h
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/3/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"

/*
 "id": "JAP122",
 "image": "http://d1.myhotel.com/food_image1.jpg",
 "name": "Teriyaki Bento",
 "spicyLevel": 2,
 "rating" : 4,
 "description" : "Teriyaki Bento is one of the best lorem ipsum dolor sit",
 "waitingTime" : "930",
 "reviewCount" : 4
 */

@interface MenuItem : KEJSONModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *spicyLevel;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *waitingTime;
@property (nonatomic, strong) NSString *reviewCount;

@property (nonatomic, strong) NSMutableArray *reviews;


@end
