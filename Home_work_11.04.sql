-- Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)

SELECT ShipperName, 
COUNT(*) AS total_orders
FROM Shippers
JOIN Orders ON Shippers.ShipperID = Orders.ShipperID
GROUP BY ShipperName
HAVING (total_orders) > 250

-- Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)

SELECT OrderID, COUNT(ProductId) AS Quantity
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) >= 3;

-- Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: название_категории, мин_стоимость_товара)
SELECT Categories.CategoryName,
MIN(Products.Price) AS min_price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Products.CategoryID != 2
GROUP BY Products.CategoryID


--  Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилия_менеджера, к-восозданных_заказов)
SELECT
Employees.LastName,
COUNT(OrderID) AS total_orders
FROM Orders

JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID

GROUP BY Orders.EmployeeID

ORDER BY total_orders DESC
LIMIT 1 OFFSET 3

-- Вывести данные о товарах от поставщиков 4 и 8 (проекция: всеимеющиеся_поля, цена_соскидкой 1.5 процента, цена_с_наценкой 0.5процента)