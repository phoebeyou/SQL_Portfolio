CREATE TABLE passengers (
  PassengerId INT,
  Survived INT,
  Pclass INT,
  Name TEXT,
  Sex TEXT,
  Age REAL,
  SibSp INT,
  Parch INT,
  Ticket TEXT,
  Fare REAL,
  Cabin TEXT,
  Embarked CHAR(1)
);

-- Test
SELECT*
FROM passengers
LIMIT 5;

-- Task1: Calculate the overall survival rate:
SELECT AVG(Survived) AS overall_survival_rate 
FROM passengers;

-- Task2: Calculate the survival rate by sex:
SELECT Sex, AVG(Survived) AS survival_rate_by_sex 
FROM passengers 
GROUP BY Sex;

-- Task3: Calculate the survival rate by passenger class:
SELECT Pclass, AVG(Survived) AS survival_rate_by_class 
FROM passengers 
GROUP BY Pclass;

-- Task4: Find the average age of passengers, categorized by survival status, sex, and class:
SELECT Survived, Sex, Pclass, AVG(Age) AS average_age
FROM passengers
GROUP BY Survived, Sex, Pclass;





