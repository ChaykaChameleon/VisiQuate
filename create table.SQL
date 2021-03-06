﻿    IF OBJECT_ID('dbo.TAB_BRAND_ENGINE_TYPES', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_BRAND_ENGINE_TYPES;

    IF OBJECT_ID('dbo.TAB_ENGINE_TYPES', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_ENGINE_TYPES;
 
    IF OBJECT_ID('dbo.TAB_OPERATING_INCOME', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_OPERATING_INCOME;

    IF OBJECT_ID('dbo.TAB_MODELS', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_MODELS;
    
    IF OBJECT_ID('dbo.TAB_FOUNDERS', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_FOUNDERS;

    IF OBJECT_ID('dbo.TAB_BRAND', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_BRAND;

    IF OBJECT_ID('dbo.TAB_CEO', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_CEO;

    IF OBJECT_ID('dbo.TAB_COUNTRY', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_COUNTRY;


    IF OBJECT_ID('dbo.TAB_HEADQUARTERS', 'U') IS NOT NULL
DROP TABLE VISIQUATE.dbo.TAB_HEADQUARTERS;




-- Создание таблцы CEO
CREATE TABLE VISIQUATE.dbo.TAB_CEO (
  ID int IDENTITY,
  NAME varchar(50) NULL,
  CONSTRAINT PK_TAB_CEO_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_CEO_NAME UNIQUE (NAME)
)
ON [PRIMARY]
GO
-- Создание таблцы Страны
CREATE TABLE VISIQUATE.dbo.TAB_COUNTRY (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  CONSTRAINT PK_TAB_COUNTRY_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_COUNTRY UNIQUE (NAME)
)
ON [PRIMARY]
GO


-- Создание таблцы Главный офис
CREATE TABLE VISIQUATE.dbo.TAB_HEADQUARTERS (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  CONSTRAINT PK_TAB_HEADQUARTERS_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_HEADQUARTERS_NAME UNIQUE (NAME)
)
ON [PRIMARY]
GO


-- Создание таблцы Бренды
CREATE TABLE VISIQUATE.dbo.TAB_BRAND (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  ID_CEO int NOT NULL,
  ID_COUNTRY int NULL,
  ID_HEADQUARTERS int NULL,
  FOUNDATION date NOT NULL,
  EV bit NOT NULL DEFAULT (0),
  CONSTRAINT PK_TAB_BRAND_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_BRAND_NAME UNIQUE (NAME)
)
ON [PRIMARY]
GO

ALTER TABLE VISIQUATE.dbo.TAB_BRAND
  ADD CONSTRAINT FK_TAB_BRAND_ID_CEO FOREIGN KEY (ID_CEO) REFERENCES dbo.TAB_CEO (ID)
GO

ALTER TABLE VISIQUATE.dbo.TAB_BRAND
  ADD CONSTRAINT FK_TAB_BRAND_ID_COUNTRY FOREIGN KEY (ID_COUNTRY) REFERENCES dbo.TAB_COUNTRY (ID)
GO

ALTER TABLE VISIQUATE.dbo.TAB_BRAND
  ADD CONSTRAINT FK_TAB_BRAND_ID_HEADQUARTERS FOREIGN KEY (ID_HEADQUARTERS) REFERENCES dbo.TAB_HEADQUARTERS (ID)
GO




-- Создание таблцы Модели
CREATE TABLE VISIQUATE.dbo.TAB_MODELS (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  ID_BRAND int NOT NULL,
  CONSTRAINT PK_TAB_MODELS_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_MODELS_NAME UNIQUE (NAME, ID_BRAND)
)
ON [PRIMARY]
GO

ALTER TABLE VISIQUATE.dbo.TAB_MODELS
  ADD CONSTRAINT FK_TAB_MODELS_ID_BRAND FOREIGN KEY (ID_BRAND) REFERENCES dbo.TAB_BRAND (ID)
GO

-- Создание таблцы Учредители
CREATE TABLE VISIQUATE.dbo.TAB_FOUNDERS (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  ID_BRAND int NULL,
  CONSTRAINT PK_TAB_FOUNDERS_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_FOUNDERS UNIQUE (NAME, ID_BRAND)
)
ON [PRIMARY]
GO

ALTER TABLE VISIQUATE.dbo.TAB_FOUNDERS
  ADD CONSTRAINT FK_TAB_FOUNDERS_ID_BRAND FOREIGN KEY (ID_BRAND) REFERENCES dbo.TAB_BRAND (ID)
GO



-- Создание таблцы Операционный доход
CREATE TABLE VISIQUATE.dbo.TAB_OPERATING_INCOME (
  ID int IDENTITY,
  ID_BRAND int NOT NULL,
  DATE date NOT NULL,
  SUMM decimal NOT NULL,
  CONSTRAINT PK_TAB_OPERATING_INCOME_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_OPERATING_INCOME UNIQUE (ID_BRAND, DATE)
)
ON [PRIMARY]
GO

ALTER TABLE VISIQUATE.dbo.TAB_OPERATING_INCOME
  ADD CONSTRAINT FK_TAB_OPERATING_INCOME_ID_BRAND FOREIGN KEY (ID_BRAND) REFERENCES dbo.TAB_BRAND (ID)
GO

-- Создание таблицы Типы двигателей
CREATE TABLE VISIQUATE.dbo.TAB_ENGINE_TYPES (
  ID int IDENTITY,
  NAME varchar(50) NOT NULL,
  CONSTRAINT PK_TAB_ENGINE_TYPES_ID PRIMARY KEY CLUSTERED (ID),
  CONSTRAINT KEY_TAB_ENGINE_TYPES_NAME UNIQUE (NAME)
)
ON [PRIMARY]
GO

-- Создание таблицы связи Брендов и Типами двигателей

CREATE TABLE VISIQUATE.dbo.TAB_BRAND_ENGINE_TYPES (
  ID_BRAND int NOT NULL,
  ID_ENGINE_TYPES int NOT NULL,
  CONSTRAINT KEY_TAB_BRAND_ENGINE_TYPES UNIQUE (ID_BRAND, ID_ENGINE_TYPES)
)
ON [PRIMARY]
GO

ALTER TABLE VISIQUATE.dbo.TAB_BRAND_ENGINE_TYPES
  ADD CONSTRAINT FK_TAB_BRAND_ENGINE_TYPES_ID_BRAND FOREIGN KEY (ID_BRAND) REFERENCES dbo.TAB_BRAND (ID)
GO

ALTER TABLE VISIQUATE.dbo.TAB_BRAND_ENGINE_TYPES
  ADD CONSTRAINT FK_TAB_BRAND_ENGINE_TYPES_ID_ENGINE_TYPES FOREIGN KEY (ID_ENGINE_TYPES) REFERENCES dbo.TAB_ENGINE_TYPES (ID)
GO