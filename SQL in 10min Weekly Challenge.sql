SELECT *
FROM OrderItems;

SELECT cust_name 
FROM Customers 
WHERE cust_zip = 44444;

# Lesson 11/12 Challenges 
	## 1
SELECT cust_name, order_num
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

	## 2
#### This is wrong:
SELECT cust_name, order_num, OrderTotal
FROM Customers, Orders, OrderItems 
WHERE Customers.cust_id = Orders.cust_id
AND OrderItems.order_num = Orders.order_num
AND OrderTotal = OrderItems.quantity*OrderItems.item_price;

SELECT cust_name,
       order_num,
       (SELECT Sum(item_price*quantity)
       FROM OrderItems
       WHERE Orders.order_num=OrderItems.order_num) AS OrderTotal
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

	## 3
SELECT cust_id, order_date
FROM Orders
WHERE order_num IN (SELECT order_num
		FROM OrderItems
        WHERE prod_id = 'BR01')
ORDER BY order_date;

SELECT cust_id, order_date
FROM Orders, OrderItems 
WHERE Orders.order_num = OrderItems.order_num
AND prod_id = 'BR01'
ORDER BY order_date;

	## 4
SELECT cust_email
FROM Customers
WHERE cust_id IN (SELECT cust_id 
					FROM Orders 
                    WHERE order_num IN (SELECT order_num
										FROM OrderItems
                                        WHERE prod_id = 'BR01')
					)
