ALTER TABLE sales_dataset_rfm_prj
ADD column CONTACTLASTNAME VARCHAR(20),
ADD column CONTACTFIRSTNAME VARCHAR(20);
UPDATE sales_dataset_rfm_prj
SET CONTACTLASTNAME = 
SUBSTRING(CONTACTFULLNAME FROM POSITION('-' IN CONTACTFULLNAME) +1 ),
CONTACTFIRSTNAME = 
LEFT(CONTACTFULLNAME, POSITION('-' IN CONTACTFULLNAME) - 1);
UPDATE sales_dataset_rfm_prj
SET CONTACTLASTNAME = UPPER(LEFT(CONTACTLASTNAME,1))|| 
LOWER(SUBSTRING(CONTACTLASTNAME FROM 2 FOR LENGTH(CONTACTLASTNAME))),
CONTACTFIRSTNAME = UPPER(LEFT(CONTACTFIRSTNAME,1)) || 
LOWER(SUBSTRING(CONTACTFIRSTNAME FROM 2 FOR LENGTH(CONTACTFIRSTNAME)))
