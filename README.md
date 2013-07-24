A simple JSON to Object Model mapper for iOS

---
This is Version 0.01. Please read the [wiki](https://github.com/kechan/KEJSONModel/wiki) page for more details. This code has been tested with iOS 6.0 and XCode 4.6.3

---

### What is KEJSONModel?
It is a convenient and lightweight mapper that helps with mapping JSON messages to a hierachy/tree of NSObject-based 
objects, with as little repetitive coding as possible. For example, if you have a JSON that looks like this:

```json
    { 
	"menuItems" : [{
			"id" : "1",
			"name" : "Teriyaki",
			"spicy_level" : "2",
			"review-count" : "4",
			"reviews" : [{
					"id" : "2",
					"reviewText" : "This is awesome!",
					"reviewerName" : "Cool dude",
					"rating" : "5"
				}]
			}],
	"status" : {
		"code" : "0",
		"localdesc" : "Everything is alright."
      },
    }
```
 And you want to be able to just say these,
 
```objective-c
 	// data is the NSData representation of the above JSON message.
 	NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
 	self.menu = [[Menu alloc] initWithDictionary:dict];
 	
 	for (MenuItem *menuItem in self.menu.menuItems) {
 		NSLog(@"id = %@", menuItem.itemId);
 		NSLog(@"name = %@", menuItem.name);
 		NSLog(@"spicy = %@", menuItem.spicyLevel);
 		NSLog(@"review count = %@", menuItem.reviewCount);
 		
 		for (Review *review in menuItem.reviews) {
 			NSLog("review id = %@", review.reviewId);
 			NSLog("reviewer name = %@", review.reviewerName);
 			// etc.
 		}
 	}
 	
 	NSLog(@"Status code = %@", self.menu.status.code);
 	NSLog(@"Status Description = %@", self.menu.status.localdesc);
 ```
 
Then KEJSONModel can help you a bit! 

It basically combines the use of Objective C's powerful feature known as Key-Value Coding (KVC) and a bit of objective c runtime magic, to dramatically reduce
the amount of boiler plate code you would need to write. This is inspired by features found in Core Data, as well as the web framework Ruby on Rails.

### Why do I even want to do that??
If your app connects to a web service (such as Twitter), you will likely receive a response in JSON format, which can end
up as NSString or NSData. Ideally, this data should be wrapped in an object, that have a set of properties, just like your
other nice classes/objects. Your set (or hierarchy/tree) of such data-oriented classes/objects naturally form part of your "Model",
in your overall MVC application architecture.


###How to use?
Read the [wiki](https://github.com/kechan/KEJSONModel/wiki) for a quick walk through. 
