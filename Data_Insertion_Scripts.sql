-- Switching to new database
USE ProductInventoryDB

-- Sample data for Categories table 
INSERT INTO Categories (Name, Description)
VALUES
    ('Electronics', 'Electronic gadgets and appliances'),
    ('Clothing', 'Clothing items and accessories'),
    ('Furniture', 'Furniture and home decor'),
    ('Books', 'Books of various genres'),
    ('Sports Equipment', 'Sporting goods and gear'),
    ('Appliances', 'Household appliances and electronics'),
    ('Toys', 'Children''s toys and games'),
    ('Clothing Accessories', 'Accessories like belts, hats, and scarves'),
    ('Kitchenware', 'Cookware and kitchen appliances'),
    ('Office Supplies', 'Stationery and office equipment'),
    ('Gardening Tools', 'Tools and equipment for gardening'),
    ('Health and Fitness', 'Fitness equipment and health products'),
    ('Beauty and Personal Care', 'Cosmetics and personal care items'),
    ('Automotive', 'Automotive parts and accessories'),
    ('Pet Supplies', 'Supplies for pets and pet care'),
    ('Home Decor', 'Decorative items for homes'),
    ('Jewelry', 'Fashion and fine jewelry'),
    ('Musical Instruments', 'Musical instruments and accessories'),
    ('Outdoor Gear', 'Outdoor sports and camping gear'),
    ('Craft Supplies', 'Art and craft supplies'),
    ('Baby Products', 'Products for infants and toddlers'),
    ('Travel Accessories', 'Accessories for travelers'),
    ('Electrical Components', 'Electronic and electrical components'),
    ('Industrial Tools', 'Tools for industrial applications');

-- Sample data for Suppliers table 
INSERT INTO Suppliers (Name, ContactName, ContactEmail, ContactPhone)
VALUES
    ('ABC Electronics', 'Misbah Yousuf', 'Misbahyousuf@abc.com', '+1234567890'),
    ('Fashion Mart', 'Saeed Ajmal', 'Saeed@fashionmart.com', '+9876543210'),
    ('Home Furnishings Inc.', 'Umar Akmal', 'Umar@homefurnishings.com', '+4567890123'),
    ('Book World', 'Umar Gul', 'Umar@bookworld.com', '+7890123456'),
    ('Tech Haven', 'Murad Rizvi', 'Murad@techhaven.com', '+1234567890'),
    ('Fashion Trends', 'Rizwan Sarfraz', 'RS@fashiontrends.com', '+9876543210'),
    ('Home Essentials', 'Arham Zaidi', 'Arham@homeessentials.com', '+4567890123'),
    ('Read More Books', 'Ibrahim Arshad', 'Ibrahim@readmorebooks.com', '+7890123456'),
    ('Sports Gear Co.', 'Muhammad Ali', 'mali@sportsgearco.com', '+2345678901'),
    ('Electronics World', 'Abdul Wassay', 'wassay@electronicsworld.com', '+3456789012'),
    ('Outdoor Adventures', 'Inzamam haq', 'inzi@outdooradventures.com', '+4567890123'),
    ('Healthy Living Store', 'Waqar Wasim', 'WaqarWasim@healthylivingstore.com', '+5678901234'),
    ('Auto Parts Plus', 'Hamza Shoaib', 'hamza@autopartsplus.com', '+6789012345'),
    ('Pet Paradise', 'Rahul Burela', 'Rahul@petparadise.com', '+7890123456'),
    ('Home Decorations', 'Babar Azam', 'Babar@homedecorations.com', '+7890123456'),
    ('Luxury Jewelry', 'Virat Sharma', 'Sharma@luxuryjewelry.com', '+1234567890'),
    ('Music World', 'Rahul Sehwag', 'rahul@musicworld.com', '+9876543210'),
    ('Adventure Gear', 'Amir Asif', 'AmirAsif@adventuregear.com', '+4567890123'),
    ('Artistic Supplies', 'Iftikhar Haris', 'Iftikharharis@artisticsupplies.com', '+7890123456'),
    ('Baby Essentials', 'Sarah Ahsan', 'Sarah@babyessentials.com', '+2345678901'),
    ('Travel Smart', 'Nasir Shafique', 'Nasir@travelsmart.com', '+3456789012'),
    ('Electronics Supply', 'Imran Akhtar', 'Imran@electronicssupply.com', '+4567890123'),
    ('Industrial Solutions', 'Rana Sami', 'Rana@industrialsolutions.com', '+5678901234');

-- Sample data for Products table 
INSERT INTO Products (Name, Description, Price, Quantity, CategoryID, SupplierID)
VALUES
    ('Tablet', 'High-performance tablet', 499.99, 40, 1, 1),
    ('Digital Camera', '12MP digital camera', 299.99, 25, 1, 2),
    ('Running Shoes', 'Running shoes with advanced cushioning', 79.99, 150, 2, 3),
    ('Coffee Table', 'Wooden coffee table', 129.99, 30, 3, 4),
    ('Mystery Novel', 'Best-selling mystery novel', 19.99, 75, 4, 5),
    ('Yoga Mat', 'Non-slip yoga mat', 29.99, 100, 8, 8),
    ('Garden Hose', 'Heavy-duty garden hose', 34.99, 50, 7, 7),
    ('Laptop', 'High-performance laptop', 899.99, 15, 1, 1),
    ('Smart Watch', 'Fitness and health monitoring smartwatch', 199.99, 50, 1, 5),
    ('Dress Shirt', 'Formal dress shirt', 39.99, 80, 2, 6),
    ('Desk Chair', 'Ergonomic office desk chair', 149.99, 40, 3, 7),
    ('Action Figure', 'Collectible action figure', 9.99, 200, 6, 8),
    ('Gardening Gloves', 'Protective gardening gloves', 7.99, 150, 11, 9),
    ('Protein Powder', 'Whey protein powder', 29.99, 100, 12, 10),
    ('Car Oil Filter', 'Automotive oil filter', 4.99, 300, 13, 11),
    ('Cat Food', 'Premium cat food', 12.99, 120, 14, 12),
    ('Wall Clock', 'Decorative wall clock', 19.99, 60, 15, 13),
    ('Diamond Ring', 'Exquisite diamond ring', 999.99, 10, 16, 14),
    ('Grand Piano', 'Concert grand piano', 4999.99, 5, 17, 15),
    ('Camping Tent', 'Spacious camping tent', 129.99, 20, 18, 16),
    ('Oil Paint Set', 'Professional oil paint set', 49.99, 30, 19, 17),
    ('Baby Stroller', 'Stylish baby stroller', 79.99, 50, 20, 18),
    ('Travel Backpack', 'Durable travel backpack', 39.99, 70, 21, 19),
    ('Resistors Pack', 'Electronic resistors assortment', 9.99, 200, 22, 20),
    ('Power Drill', 'Heavy-duty power drill', 149.99, 25, 23, 21);

-- Sample data for Transactions table 
INSERT INTO Transactions (TransactionDate, ProductID, Quantity, TransactionType)
VALUES
    ('2023-04-05', 2, 1, 'Out'),
    ('2023-04-10', 3, 2, 'In'),
    ('2023-04-15', 1, 4, 'Out'),
    ('2023-05-01', 4, 1, 'Out'),
    ('2023-05-05', 5, 3, 'In'),
    ('2023-05-10', 6, 5, 'Out'),
    ('2023-05-15', 7, 2, 'In'),
    ('2023-05-20', 8, 3, 'Out'),
    ('2023-06-01', 9, 1, 'In'),
    ('2023-06-05', 10, 2, 'Out'),
    ('2023-06-10', 11, 3, 'In'),
    ('2023-06-15', 12, 1, 'Out'),
    ('2023-06-20', 13, 4, 'In'),
    ('2023-06-25', 14, 2, 'Out'),
    ('2023-07-01', 15, 1, 'In'),
    ('2023-07-05', 16, 3, 'Out'),
    ('2023-07-10', 17, 2, 'In'),
    ('2023-07-15', 18, 1, 'Out'),
    ('2023-07-20', 19, 4, 'In'),
    ('2023-07-25', 20, 2, 'Out'),
    ('2023-08-01', 21, 1, 'In'),
    ('2023-08-05', 22, 3, 'Out'),
    ('2023-08-10', 23, 2, 'In');

