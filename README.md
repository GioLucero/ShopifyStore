# ShopifyStore - iOS internship challenge for fall 2020 submission

This project submission is for the Mobile Developer (iOS) intern challenge at Shopify for Fall 2020

The project created is a native iOS mobile store that creates a shopping expereince from three given API’s from Shopify. 

<p float="left" align="center">
<img src="./Documentation/home-screen.png" width="150"/>
<img src="./Documentation/darkmode-screen.png" width="150"/>
<img src="./Documentation/profile-screen.png" width="150"/>
</p>

# Features

## Collections Page

<img src="./Documentation/home-screen.png" width="150"/>

* Header card which displays amount of collections in the store
* List of multiple collectionc cards. When selecting a specific collection, the user is navigated to a list of products that are apart of the selected collection*


## Products Page
<img src="./Documentation/products-screen.png" width="150"/>

* Parallax Banner displays information which describes the collection selected.
* List of products that belong to the collection (previously selected by the user)
* Each product card contains the following information: 
    * Name of product
    * Price
    * Image
    * Inventory remaining
    * Vendor of product
* A 'GET' button, which allows users to add the selected product to their shopping cart
    
## Shopping Cart Page
<img src="./Documentation/shoppingcart-screen.png" width="150"/>

* Displays unique view when shopping cart contains 0 products
    * Lottie animation is displayed
    * Text description informs user that shopping cart is empty
* When products have been added, the view organizes the products into a list
* With the list of products, users can swipe to delete, or use the edit button to remove items
* Checkout button displays the total cost of items in the shopping cart
    * When selected, the user will be navigated to checkout flow
    
## Checkout Flow
<img src="./Documentation/checkout-screen.png" width="150"/>

* Option to ship to multiple Shopify offices
* Displays pricing details:
    * Shipping cost
    * HST/GST
    * Subtotal
    * Total cost of Order
* Toggle button to recieve email notification
* Date picker to display the date
* Users recieve confirmation prompt when user submits order and shopping cart/checkout flow is cleared

# File Architecture - Model View ViewModel (MVVM)
This project is built using SwiftUIf ramework. 
 
This project uses the following third-party Swift packages and dependencies: 
* https://github.com/Alamofire/Alamofire
* SwiftyJSON: https://github.com/SwiftyJSON/SwiftyJSON
* Lottie: https://github.com/airbnb/lottie-ios




