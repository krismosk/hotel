What classes does each implementation include? Are the lists the same?
  - A: CartEntry, ShoppingCart, Order
  - B: CartEntry, ShoppingCart, Order
  - Classes are the same for each

Write down a sentence to describe each class.
 - CartEntry: initializes the CartEntry object with unit_price and quantity attributes.
 - ShoppingCart: initializes the ShoppingCart object with an empty array called entries as its attribute.
 - Order: creates a new instance of ShoppingCart and stores the constant variable of SALES_TAX, then calculates total_price of each item in a ShoppingCart

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  - The Order class is the parent of CartEntry and ShoppingCart. The Order class creates an instance of ShoppingCart then calculates the total price of the Order. The ShoppingCart class stores instances of CartEntry (presumably)

What data does each class store? How (if at all) does this differ between the two implementations?
 - A: 
  - CartEntry stores info about its own unit_price, quantity and allows you to read and write this attributes from other classes
  - ShoppingCart stores an empty array of entries and allows you to read and write this attribute from another class
  - Order stores a constant value for SALES_TAX, an instance of ShoppingCart
- B: 
  - CartEntry stores info about its own unit_price, quantity
  - ShoppingCart stores an empty array of entries
  - Order stores a constant value for SALES_TAX, an instance of ShoppingCart
Implementation B doesn't contain any attr_accessor's, readers, or writers so that each classes' attributes are only known to that class specifically.

What methods does each class have? How (if at all) does this differ between the two implementations?
- A: 
  - CartEntry: initialize
  - ShoppingCart: initialize
  - Order: initialize and total_price
- B: 
  - CartEntry: initialize, price
  - ShoppingCart: initialize, price
  - Order: initialize, total_price
Implementation B gives each class its own ability to calculate the price with their own attributes as opposed to Version A which only gives Order this responsibility. ShoppingCart Version B is interesting in that it stores a list of CartEntry objects, and can call the .price attribute on each object, then sum the values. 

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
 - A: logic to compute price is retained in Order
 - B: logic to compute price is delegated to lower level classes
Does total_price directly manipulate the instance variables of other classes?
- A: yes, it calls the .entries attribute on the ShoppingCart class then .unit_price and .quantity on the CartEntry class to calculate the price
- B: yes, but it only calls the .price attribute method on the instance of ShoppingCart that it created itself within the Order class 

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
- Implementation B would be easier to modify because you would just need to create a new attribute in CartEntry for bulk_price and modify the price method to use the new attribute instead of unit_price

Which implementation better adheres to the single responsibility principle?
- Implementation B

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
- B

-- Hotel Class --
What is this class's responsibility?

Is this class responsible for exactly one thing?

Does this class take on any responsibility that should be delegated to "lower level" classes?

Is there code in other classes that directly manipulates this class's instance variables?

What changes would I need to make to improve this design?

How would the new design be a new improvement? 

-- Reservation Class --
What is this class's responsibility?

Is this class responsible for exactly one thing?

Does this class take on any responsibility that should be delegated to "lower level" classes?

Is there code in other classes that directly manipulates this class's instance variables?

-- Room Class --
What is this class's responsibility?

Is this class responsible for exactly one thing?

Does this class take on any responsibility that should be delegated to "lower level" classes?

Is there code in other classes that directly manipulates this class's instance variables?