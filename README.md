## Entity Relationship Model (Crow’s Foot, Inheritance)
![image](https://github.com/dilaygulru/Shopping-Database-With-WindowsForm/assets/123947023/b455bf63-6710-470d-962b-99b63ed6ca75)


 
## Introduction of the problem, creation of the business rules

The problem at hand involves designing and managing the database schema for an online shopping platform. The system encompasses various entities, each with specific attributes and relationships. Let's break down the key components and relationships outlined in the business rules:

1) In the system, each users has userID, username, email information. Also, a user can exist in just two categories: User Profiles and Seller Profiles. A user can also be both of them. User Profiles and Seller Profiles have also some spesific attributes which are written in the next business rules.
2) User Profiles information should include profileID, firstname, lastname and address of user.
3) Seller Profiles information should include, storeID, firstname, lastname and registration date.
4) Products information includes productID, productname, price, stock and categoryID information.
5) ShoppingCart information includes cartID, productID, orderID, date, cargo address and quantity information.
6) Orders information includes orderID, order date and order information.
7) Categories information includes categoryID, category name, description, image url information.
8) Payments information includes paymentID, amount and payment method  information.
9) User Points information includes pointID, points, point description and elite member  information.
10) A user may have no order or it can also have many orders. A order can be taken from of only one user.
11) An order can contain one or more products. One product can appear in more than one order.
12) Orders contain total price and quantities of products. This information must be recorded separately as order details.
13) A user may not have a shopping cart or may have many shopping carts. A shopping cart can only be retrieved by one user.
14) A product has only one category. A category can have one or more than one products.
15) A payment may associated with only one specific order,order may have multiple  payments.
16) A user proile may associated with only one specific user points. User points also may have only one user profile. 
17) A order can contain only one shopping cart. A shopping cart can include zero or many orders.

## Relational model (textual representation)

- Users (userID: serial, username: varchar(15), email: varchar(30), sellerProfiles: boolean, userProfiles: boolean )
- SellerProfiles (userID: int, storeID: int, firstname: varchar(15), lastname: varchar(15), registrationDate: date )
- UserProfiles (userID: int, profileID: int, firstname: varchar(15), usserAdress: varchar(50)
- ShoppingCart (cartID: serial, userID: int, orderID: int, cargoAdress: varchar(40), date: date) 
- UserPoints (pointID: serial, userID: int, points: smallint default 0, description: text, eliteMember: boolean)
- Orders (orderID: serial, userID: int, orderInfo: varchar(30), orderDate: date )
- Categories (categoryID: serial, categoryName: varchar(20), description: text, imageURL: text )
- Products (productID: serial, categoryID: int, price: money, stock: int, productName: varchar(30) )
- OrderDetails (orderID: int, productID: int, quantities: int, totalprice: money)
- Payments (paymentID: serial, orderID: int, paymentMethod: varchar(20), amount: money)

