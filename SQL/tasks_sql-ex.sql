https://www.sql-ex.ru/

Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). 
Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. 
В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), 
скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), 
размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price. 
Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). 
В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), 
тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.
----------------------------------------------------------------------
Задание: 1
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM PC
WHERE price < 500;

model	speed	hd
1232	500	10.0
1232	450	8.0
1232	450	10.0
1260	500	10.0
----------------------------------------------------------------------
Задание: 2
Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer';

maker
A
D
E
----------------------------------------------------------------------
Задание: 3
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen
FROM Laptop
WHERE price > 1000;

model	ram	screen
1750	128	14
1298	64	15
1752	128	14
----------------------------------------------------------------------
Задание: 4
Найдите все записи таблицы Printer для цветных принтеров.

SELECT * FROM Printer
WHERE color = 'y';

code	model	color	type	price
3	1434	y	Jet	290.0000
2	1433	y	Jet	270.0000
----------------------------------------------------------------------
Задание: 5
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT DISTINCT model, speed, hd
FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600;

model	speed	hd
1232	450	8.0
1232	450	10.0
1232	500	10.0
1260	500	10.0
----------------------------------------------------------------------
Задание: 6
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT maker, speed
FROM Product INNER JOIN Laptop on Laptop.model = Product.model
WHERE hd >= 10;

maker	speed
A	450
A	600
A	750
B	750
----------------------------------------------------------------------
Задание: 7





