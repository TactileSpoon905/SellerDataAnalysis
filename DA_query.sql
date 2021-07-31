-- Initiate with selecting the required columns for classifying category types. I used a subquery to make readablity easy.
-- Using CASE statements (if-else of SQL) with wildcards makes string processing very easy. Note that I used [] operators
-- to account for grammatical errors (ex: label and lable) to esure no data is ignored. The 'Tags' primary key attribute 
-- contains alphabets which are used as reference to join with the table 'tagging' for quick indexing.

SELECT ASIN, OPR, b.Category
INSERT INTO temp_table
FROM (
SELECT ASIN, OPR,

CASE 
WHEN OPR LIKE '%lab[el]%' THEN 'a'
WHEN OPR LIKE '%low sale%' OR OPR LIKE '%no shipment%' THEN 'b'
WHEN OPR LIKE '%seasonal%' THEN 'c'
WHEN OPR LIKE '%delay%' THEN 'd'
WHEN OPR LIKE '%high cost%' THEN 'e'
WHEN OPR LIKE '%aeging%' THEN 'g'
WHEN OPR LIKE '%hijack%' THEN 'h'
WHEN OPR LIKE '%https%' THEN 'i'
WHEN OPR LIKE '%counterfeit%' OR OPR LIKE '%gating%' THEN 'k'
WHEN OPR LIKE '%OPR%' OR OPR LIKE '%turned on too%' THEN 'm'
WHEN OPR LIKE '%no more selling%' THEN 'o'
WHEN OPR LIKE '%zero%' THEN 'p'
ELSE 'l'

END AS Tags
FROM dataset
WHERE OPR != 'NULL' 
GROUP BY ASIN, OPR
) a
INNER JOIN tagging b
ON a.Tags = b.Tag
ORDER BY OPR

-- Once this query is executed you can see categories are assigned based on OPR comments. Keep in mind this
-- can also be done in MS Excel using INDEX and MATCH functions. However it is complicated when it comes to 
-- matching with strings with grammatical errors. To prepare the sample data, a temporary table can be created 
-- by using "INTO temp_table" clause in line 7 in this editor. Then a simple COUNT and GROUP BY can be used to 
-- obtain the sample data as shown below

SELECT Category, COUNT(Category) AS Total
FROM temp_table
GROUP BY Category

-- With this query result in the pane, click on 'visualizer' icon located on bottom right to open a new tab
-- with the SandDance tool.For further analysis, Azure Data Studio provides a visualizer tool in the results 
-- pane (SandDance) which can be used to view data summary in just a few clicks. Select :
--                      Chart -> column
--                      X-axis -> Category
--                      Color by -> Category
--                      Total by -> SUM(strip layout)
-- See the attached png file in this repository to view the visual data done in SandDance