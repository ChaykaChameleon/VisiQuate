
--Обнуляем таблицы 
DELETE FROM TAB_BRAND_ENGINE_TYPES;
DELETE FROM TAB_ENGINE_TYPES;
DELETE FROM TAB_OPERATING_INCOME;
DELETE FROM TAB_MODELS;
DELETE FROM TAB_BRAND;
DELETE FROM TAB_CEO;
DELETE FROM TAB_COUNTRY;
DELETE FROM TAB_FOUNDERS;
DELETE FROM TAB_HEADQUARTERS;

--Заполняем таблицу CEO
INSERT INTO TAB_CEO (NAME)
  VALUES ('Oliver Zipse'),
  ('Abraham Schot'),
  ('Yasushi Kimura'),
  ('Bernhard Maie');

--Заполняем таблицу страны 
INSERT INTO TAB_COUNTRY (NAME)
  VALUES ('Germany'),
  ('Japan'),
  ('Czech Republic');

--Заполняем таблицу Главный офис
INSERT INTO TAB_HEADQUARTERS (NAME)
  VALUES ('Munich, Germany'),
  ('Ingolstadt, Germany'),
  ('Nishi-ku, Yokohama, Japan'),
  ('Mladá Boleslav, Czech Republic');



--Заполняем таблицу Типы двигателей
INSERT INTO TAB_ENGINE_TYPES (NAME)
  VALUES ('gasoline'),
  ('diesel');



--Добовляем Бренды
INSERT INTO TAB_BRAND (NAME, ID_CEO, ID_COUNTRY, ID_HEADQUARTERS, FOUNDATION, EV)
  VALUES ('BMW', (SELECT ID FROM TAB_CEO WHERE NAME = 'Oliver Zipse'), (SELECT ID FROM TAB_COUNTRY WHERE NAME = 'Germany'), (SELECT ID FROM TAB_HEADQUARTERS WHERE NAME = 'Munich, Germany'), '19160101', 1),
  ('AUDI', (SELECT ID FROM TAB_CEO WHERE NAME = 'Abraham Schot'), (SELECT ID FROM TAB_COUNTRY WHERE NAME = 'Germany'), (SELECT ID FROM TAB_HEADQUARTERS WHERE NAME = 'Ingolstadt, Germany'), '19090501', 0),
  ('Nissan', (SELECT ID FROM TAB_CEO WHERE NAME = 'Yasushi Kimura'), (SELECT ID FROM TAB_COUNTRY WHERE NAME = 'Japan'), (SELECT ID FROM TAB_HEADQUARTERS WHERE NAME = 'Nishi-ku, Yokohama, Japan'), '19331226', 1),
  ('Skoda', (SELECT ID FROM TAB_CEO WHERE NAME = 'Bernhard Maie'), (SELECT ID FROM TAB_COUNTRY WHERE NAME = 'Czech Republic'), (SELECT ID FROM TAB_HEADQUARTERS WHERE NAME = 'Mladá Boleslav, Czech Republic'), '18951218', 0);

--Объявляем переменные для хранения новых ID брендов
DECLARE @VAR_ID_BMW INT,@VAR_ID_AUDI INT,@VAR_ID_NISSAN INT,@VAR_ID_SKODA INT;

--Вносим данные в переменные
SELECT
  @VAR_ID_BMW = ID
FROM tab_brand
WHERE NAME = 'BMW';
SELECT
  @VAR_ID_AUDI = ID
FROM tab_brand
WHERE NAME = 'AUDI';
SELECT
  @VAR_ID_NISSAN = ID
FROM tab_brand
WHERE NAME = 'Nissan';
SELECT
  @VAR_ID_SKODA = ID
FROM tab_brand
WHERE NAME = 'Skoda';

--Заполняем таблицу модели  
INSERT INTO TAB_MODELS (NAME, ID_BRAND)
  VALUES ('M5', @VAR_ID_BMW),
  ('X5M', @VAR_ID_BMW),
  ('M1', @VAR_ID_BMW),
  ('740L', @VAR_ID_BMW),
  ('A3', @VAR_ID_AUDI),
  ('A4', @VAR_ID_AUDI),
  ('A6', @VAR_ID_AUDI),
  ('A8', @VAR_ID_AUDI),
  ('Q5', @VAR_ID_AUDI),
  ('Q7', @VAR_ID_AUDI),
  ('GT-R', @VAR_ID_NISSAN),
  ('Juke', @VAR_ID_NISSAN),
  ('Octavia', @VAR_ID_SKODA),
  ('Rapid', @VAR_ID_SKODA),
  ('Superb III', @VAR_ID_SKODA);


--Заполняем таблицу Учредители
INSERT INTO TAB_FOUNDERS (NAME, ID_BRAND)
  VALUES ('Camillo Castiglioni', @VAR_ID_BMW),
  ('Franz Josef Popp', @VAR_ID_BMW),
  ('Karl Rapp', @VAR_ID_BMW),
  ('August Horch', @VAR_ID_AUDI),
  ('Masujiro Hashimoto', @VAR_ID_NISSAN),
  ('Kenjiro Den', @VAR_ID_NISSAN),
  ('Rokuro Aoyama', @VAR_ID_NISSAN),
  ('Meitaro Takeuchi', @VAR_ID_NISSAN),
  ('Yoshisuke Aikawa', @VAR_ID_NISSAN),
  ('William R. Gorham', @VAR_ID_NISSAN),
  ('Václav Laurin', @VAR_ID_SKODA),
  ('Václav Klement', @VAR_ID_SKODA);



--Заполняем таблицу связи Брендов и Типов двигателей
INSERT INTO TAB_BRAND_ENGINE_TYPES (ID_BRAND, ID_ENGINE_TYPES)
  VALUES (@VAR_ID_BMW, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'gasoline')),
  (@VAR_ID_BMW, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'diesel')),
  (@VAR_ID_AUDI, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'gasoline')),
  (@VAR_ID_AUDI, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'diesel')),
  (@VAR_ID_NISSAN, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'gasoline')),
  (@VAR_ID_NISSAN, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'diesel')),
  (@VAR_ID_SKODA, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'gasoline')),
  (@VAR_ID_SKODA, (SELECT ID FROM TAB_ENGINE_TYPES WHERE NAME = 'diesel'));


--Заполняем таблицу Операционный доход
INSERT INTO TAB_OPERATING_INCOME (ID_BRAND, DATE, SUMM)
  VALUES (@VAR_ID_BMW, '20170101', 18456349234),
  (@VAR_ID_BMW, '20180101', 23422343434),
  (@VAR_ID_AUDI, '20170101', 18456349234),
  (@VAR_ID_AUDI, '20180101', 23422343434),
  (@VAR_ID_NISSAN, '20160101', 23123434345),
  (@VAR_ID_NISSAN, '20170101', 18456349234),
  (@VAR_ID_NISSAN, '20180101', 23422343434),
  (@VAR_ID_SKODA, '20170101', 18456349234),
  (@VAR_ID_SKODA, '20180101', 23422343434);
