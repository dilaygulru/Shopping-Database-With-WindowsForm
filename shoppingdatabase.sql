CREATE TABLE "Users" (
   "userID" SERIAL,
   "username" VARCHAR(15),
   "email" VARCHAR(30),
   "sellerProfiles" BOOLEAN,
   "userProfiles" BOOLEAN,
   CONSTRAINT "userPK" PRIMARY KEY ("userID"),
   CONSTRAINT "emailUnique" UNIQUE("email")
);

--ON DELETE CASCADE ON UPDATE CASCADE ana tablodaki veriler silinince yan tablolardaki verileride siler.

CREATE TABLE "SellerProfiles" (
   "userID" INT,
   "storeID" INT,
   "firstName" VARCHAR(15),
   "lastName" VARCHAR(15),
   "registrationDate" DATE,
   CONSTRAINT "sellerprofilePK" PRIMARY KEY ("userID"),
   CONSTRAINT "sellerprofileFK" FOREIGN KEY ("userID") REFERENCES "Users"
   ("userID")
   ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "UserProfiles" (
   "userID" INT,
   "profileID" INT,
   "firstName" VARCHAR(15),
   "lastName" VARCHAR(15),
   "userAddress" VARCHAR(50),
   CONSTRAINT "userprofilePK" PRIMARY KEY ("userID"),
   CONSTRAINT "userprofileFK" FOREIGN KEY ("userID") REFERENCES "Users"
   ("userID")
   ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "UserPoints" (
	"pointID" SERIAL,
	"userID" INT,
	"points" SMALLINT DEFAULT 0,
	"descriptions" TEXT,
	"eliteMember" BOOLEAN,
	CONSTRAINT "pointPK" PRIMARY KEY("pointID"),
	CONSTRAINT "pointsCheck" CHECK("points" >= 0),
	CONSTRAINT "userpointsFK" FOREIGN KEY ("userID") REFERENCES "UserProfiles"
   ("userID")
);

CREATE TABLE "Orders" (
   "orderID" SERIAL,
   "userID" INT,
   "orderInfo" VARCHAR(30),
   "orderDate" DATE,
   CONSTRAINT "orderPK" PRIMARY KEY ("orderID"),
   CONSTRAINT "orderFK" FOREIGN KEY ("userID") REFERENCES "Users"
   ("userID")

);  

CREATE TABLE "ShoppingCart" (
	"cartID" SERIAL,
	"userID" INT,
	"orderID" INT,
	"cargoAddress" VARCHAR(40) NOT NULL,
	"date" DATE,
	CONSTRAINT "cartPK" PRIMARY KEY("cartID"),
	CONSTRAINT "shoppingcartFK" FOREIGN KEY ("userID") REFERENCES "Users"
   ("userID"),
    CONSTRAINT "shoppingcartFK2" FOREIGN KEY ("orderID") REFERENCES "Orders"
   ("orderID")
);

CREATE TABLE "Categories" (
   "categoryID" SERIAL,
   "categoryName" VARCHAR(20),
   "description" TEXT,
   "imageURL" TEXT,
   CONSTRAINT "categoriesPK" PRIMARY KEY ("categoryID")
   
); 

CREATE TABLE "Products" (
   "productID" SERIAL,
   "categoryID" INT,
   "price" MONEY,
   "stock" INT,
   "productName" varchar(30),
   CONSTRAINT "stockCheck" CHECK("stock" >= 0),
   CONSTRAINT "productsPK" PRIMARY KEY ("productID"),
   CONSTRAINT "productsFK" FOREIGN KEY ("categoryID") REFERENCES "Categories"
   ("categoryID")
   
);

CREATE TABLE "OrderDetails" (
   "orderID" INT,
   "productID" INT,
   "quantities" INT,
   "totalPrice" MONEY,
   CONSTRAINT "quantitiesCheck" CHECK("quantities" >= 0),
   CONSTRAINT "orderDetailsPK" PRIMARY KEY ("orderID" ,"productID"),
   CONSTRAINT "orderDetailsFK" FOREIGN KEY ("productID") REFERENCES "Products"
   ("productID") ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT "orderDetailsFK2" FOREIGN KEY ("orderID") REFERENCES "Orders"
   ("orderID")
   ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE "Payments" (
   "paymentID" SERIAL,
   "orderID" INT,
   "paymentMethod" VARCHAR(20),
   "amount" MONEY,
   CONSTRAINT "paymentPK" PRIMARY KEY ("paymentID"),
   CONSTRAINT "paymentFK" FOREIGN KEY ("orderID") REFERENCES "Orders"
   ("orderID")

);
--Users kısmını dolduruyorum
INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Dilay' , 'dilay@gmail.com' , '0' , '1');

INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Osman' , 'osman@gmail.com' , '0' , '1');

INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Osman' , 'osman8@gmail.com' , '1' , '0');

INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Rabia' , 'rabia@gmail.com' , '1' , '1');

INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Gülru' , 'gulru@gmail.com' , '1' , '0');

INSERT INTO "Users"
("username" , "email" , "sellerProfiles" , "userProfiles") 
VALUES ('Esra' , 'esra@gmail.com' , '1' , '0');

--SellerProfiles kısmını dolduruyorum
INSERT INTO "SellerProfiles"
("userID", "storeID" , "firstName" , "lastName", "registrationDate") 
VALUES ('3', '1111' , 'Osman' , 'Özdemir' , '2023-12-20');

INSERT INTO "SellerProfiles"
("userID", "storeID" , "firstName" , "lastName", "registrationDate") 
VALUES ('4', '1112' , 'Rabia' , 'Sürmeli' , '2023-12-25');

INSERT INTO "SellerProfiles"
("userID", "storeID" , "firstName" , "lastName", "registrationDate") 
VALUES ('5', '1113' , 'Gülru' , 'Özak' , '2023-1-20');

INSERT INTO "SellerProfiles"
("userID", "storeID" , "firstName" , "lastName", "registrationDate") 
VALUES ('6', '1114' , 'Esra' , 'Fettahoğlu' , '2023-1-20');

--UserProfiles kısmını dolduruyorum
INSERT INTO "UserProfiles"
("userID", "profileID" , "firstName" , "lastName" , "userAddress") 
VALUES ('1' , '2221' , 'Dilay' , 'Özak', 'İstanbul');

INSERT INTO "UserProfiles"
("userID", "profileID" , "firstName" , "lastName" , "userAddress") 
VALUES ('2' , '2222' , 'Osman' , 'Karatay', 'Gaziantep');

INSERT INTO "UserProfiles"
("userID", "profileID" , "firstName" , "lastName" , "userAddress") 
VALUES ('4', '2223' , 'Rabia' , 'Sürmeli' , 'Düzce');

--UserPoints kısmını dolduruyorum
INSERT INTO "UserPoints"
("userID", "points" , "descriptions" , "eliteMember") 
VALUES ('1' , '48' , 'Elite membership expires in 23 days' , '1');

INSERT INTO "UserPoints"
("userID", "points" , "eliteMember") 
VALUES ('2' , '87' , '0');

INSERT INTO "UserPoints"
("userID", "points" , "descriptions" , "eliteMember") 
VALUES ('4' , '33' , 'Elite membership expires in 12 days' , '1');

--Orders kısmını dolduruyorum
INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('1' , 'Has been shipped.' , '2023-12-5');

INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('2' , 'Has been shipped.' , '2023-6-30');

INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('3' , 'It is getting ready' , '2023-2-24');

INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('4' , 'Has been shipped.' , '2023-11-15');

INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('5' , 'Was delivered.' , '2023-8-5');

INSERT INTO "Orders"
("userID", "orderInfo" , "orderDate") 
VALUES ('6' , 'It is getting ready.' , '2022-3-4');

--ShoppingCart kısmını dolduruyorum
INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('1' , '1' ,'Sakarya', '2023-2-5');

INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('2' , '2' ,'İstanbul', '2023-7-21');

INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('3' , '3' ,'Erzurum', '2023-8-23');

INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('4' , '4' ,'Edirne', '2023-11-12');

INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('5' , '5' ,'İzmir', '2023-3-6');

INSERT INTO "ShoppingCart"
("userID", "orderID" , "cargoAddress", "date") 
VALUES ('6' , '6' ,'Rize', '2023-3-6');

--Categories kısmını dolduruyorum
INSERT INTO "Categories"
("categoryName" , "description", "imageURL") 
VALUES ('Clothes' , 'Women/Man/Baby' , 'img1');

INSERT INTO "Categories"
("categoryName" , "description", "imageURL") 
VALUES ('Electronics' , 'Electronics/Computers/Office' , 'img2');

INSERT INTO "Categories"
("categoryName" , "description", "imageURL") 
VALUES ('Spor&Outdoors' , 'Clothes/Camping/Equipment' , 'img3');

INSERT INTO "Categories"
("categoryName" , "description", "imageURL") 
VALUES ('Beauty' , 'Hair/Skin Care/Make-up' , 'img4');

INSERT INTO "Categories"
("categoryName" , "description", "imageURL") 
VALUES ('Books' , 'Textbook/Childrens Book/Prime' , 'img5');

--Products kısmını dolduruyorum
INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('1' , '$10.00' ,'45', 'Skirt');

INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('2' , '$52.00' ,'12', 'Telephone');

INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('3' , '$19.00' ,'14', 'Soccer Ball');

INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('4' , '$8.00' ,'60', 'Shampoo');

INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('5' , '$11.00' ,'57', 'Crime and Punishment');

INSERT INTO "Products"
("categoryID", "price" , "stock", "productName" ) 
VALUES ('3' , '$9.00' ,'34', 'Little Prince');

--OrderDetails kısmını dolduruyorum
INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('1' , '1' ,'2');

INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('2' , '2' ,'2');

INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('3' , '3' ,'1');

INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('4' , '4' ,'5');

INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('5' , '5' ,'5');

INSERT INTO "OrderDetails"
("orderID", "productID" , "quantities") 
VALUES ('6' , '6' ,'17');

--Payments kısmını dolduruyorum
INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('1' , 'Cash');

INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('2' , 'Cash');

INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('3' , 'Credit Card');

INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('4' , 'Credit Card');

INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('5' , 'Cash');

INSERT INTO "Payments"
("orderID", "paymentMethod") 
VALUES ('6' , 'Cash');

--TRİGGERS--
-- 1) Kaç ürün olacağıyla ürün başı fiyatı çarpıp total price bulan triggers

CREATE OR REPLACE FUNCTION calculateTotalPrice()
RETURNS TRIGGER AS $$
BEGIN
    NEW."totalPrice" = (
        SELECT "price" FROM "Products" WHERE "productID" = NEW."productID")* NEW."quantities"
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "updateTotalPrice"
BEFORE INSERT OR UPDATE ON "OrderDetails"
FOR EACH ROW EXECUTE PROCEDURE calculateTotalPrice();

-- 2) payments kısmındaki amountla orderdetails kısmındaki total pricei eşitleyen triggers

CREATE OR REPLACE FUNCTION updatePaymentAmount()
RETURNS TRIGGER AS $$
BEGIN
    NEW."amount" = (
        SELECT od."totalPrice"
        FROM "OrderDetails" od
        WHERE od."orderID" = NEW."orderID"
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "trigger_update_payment_amount"
BEFORE INSERT OR UPDATE ON "Payments"
FOR EACH ROW EXECUTE PROCEDURE updatePaymentAmount();

-- 3) stock sayısı güncelleyen triggers

CREATE OR REPLACE FUNCTION updateStock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE "Products"
    SET "stock" = "stock" - NEW."quantities"
    WHERE "productID" = NEW."productID";

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "trigger_update_stock"
AFTER INSERT OR UPDATE ON "OrderDetails"
FOR EACH ROW EXECUTE PROCEDURE updateStock();


-- 4) userpoints 30'u geçince elitemember'o true yapan trigger

CREATE OR REPLACE FUNCTION updateEliteMember()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW."points" > 30 THEN
        NEW."eliteMember" := true;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "after_update_points"
BEFORE INSERT OR UPDATE ON "UserPoints"
FOR EACH ROW EXECUTE PROCEDURE updateEliteMember();

--FONKSİYONLAR--

-- 1) product kısmındaki priceyi güncelleyen fonksiyon
--çağırmak için SELECT updateProductPrice(1, '$15.00');

CREATE OR REPLACE FUNCTION updateProductPrice(p_productID INT, p_newPrice MONEY)
RETURNS VOID AS $$
BEGIN
    UPDATE "Products" SET "price" = p_newPrice WHERE "productID" = p_productID;
END;
$$ LANGUAGE plpgsql;

-- 2) shoppingcart kısmındaki cargoaddress kısmını güncelleyen fonksiyon
--çağırmak için SELECT updateCargoAddress(2, 'İzmir');

CREATE OR REPLACE FUNCTION updateCargoAddress(p_cartID INT, p_newAddress VARCHAR(40))
RETURNS VOID AS $$
BEGIN
    UPDATE "ShoppingCart" SET "cargoAddress" = p_newAddress WHERE "cartID" = p_cartID;
END;
$$ LANGUAGE plpgsql;

-- 3) kullanıcının verilerini userpoints ve shoppingcarttan silen fonksiyon
--çağırmak için DELETE FROM "Users" WHERE "userID" = '8'; bunu yaz

CREATE OR REPLACE FUNCTION deleteUserRelatedData(p_userID INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM "UserPoints" WHERE "userID" = p_userID;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION afterDeleteUser()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM deleteUserRelatedData(OLD."userID");
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "after_delete_user"
AFTER DELETE ON "Users"
FOR EACH ROW EXECUTE PROCEDURE afterDeleteUser();

-- 4) kategoriye yeni ürün ekleme
--çağırmak için SELECT addProductToCategory('Yeni Elbise', '$25.00', 50, 'Clothes');


CREATE OR REPLACE FUNCTION addProductToCategory(p_productName VARCHAR(30), p_price MONEY, p_stock INT, p_categoryName VARCHAR(20))
RETURNS VOID AS $$
DECLARE
    v_categoryID INT;
BEGIN
    SELECT "categoryID" INTO v_categoryID FROM "Categories" WHERE "categoryName" = p_categoryName;

    IF v_categoryID IS NOT NULL THEN
        INSERT INTO "Products" ("productName", "price", "stock", "categoryID")
        VALUES (p_productName, p_price, p_stock, v_categoryID);
    ELSE
        RAISE EXCEPTION 'Belirtilen kategori bulunamadı: %', p_categoryName;
    END IF;
END;
$$ LANGUAGE plpgsql;



