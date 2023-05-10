CREATE TABLE iris (
  sepal_length float,
  sepal_width float,
  petal_length float,
  petal_width float,
  species varchar
);

COPY iris FROM PROGRAM 'curl https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv' WITH (FORMAT csv, HEADER);

--Test
SELECT * 
FROM iris 
LIMIT 5;

--Task#1: Count the number of each species in the dataset
SELECT species, COUNT(*) 
FROM iris 
GROUP BY species;

--Task#2: Calculate the average sepal length for each species
SELECT species, AVG(sepal_length) 
FROM iris 
GROUP BY species;

--Task#3: Find the flower with the longest petal length
SELECT * 
FROM iris 
ORDER BY petal_length DESC 
LIMIT 1;

