SELECT DISTINCT maker, Laptop.speed AS speed
FROM Product 
    INNER JOIN Laptop
    ON Laptop.model = Product.model 
WHERE hd >=10
