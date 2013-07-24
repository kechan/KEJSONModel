KEJSONModel
===========

A simple JSON to Object Model mapper for iOS

---
This is Version 0.01. Please read the wiki page for more details. This code has been tested with iOS 6.0 and XCode 4.6.3

---

### Why KEJSONModel?
It is a convenient and lightweight mapper that helps with converting JSON messages to NSObject based mode objects, with as little coding as possible. For example, if you have a JSON that looks like this:

    { 
    	"menuItems" : [{
			"id" : "1",
			"name" : "Teriyaki",
			"spicy_level" : "2",
			"review-count" : "4",
			"reviews" : [{
					"id" : "2"
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

 And you want be able to say this,
