SELECT DISTINCT maker, Laptop.speed as speed
FROM Product 
    INNER JOIN Laptop
    ON Laptop.model = Product.model 
WHERE hd >=10
