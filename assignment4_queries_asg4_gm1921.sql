
/*CSCI_UA.60-1 - Queries */


/* Query #1: Count How Many Records There Are in the Database */

SELECT COUNT(*)
FROM DOB;

/* Query #2:List The Most Recent Ten Complaints   */
SELECT complaintNumber, complaintCategory, zipCode
FROM DOB
WHERE length(complaintNumber)=7
ORDER BY complaintNumber DESC
LIMIT 10;

/* Query #3:List The First Ten Complaints To Ever Be Reported  */
SELECT complaintNumber, complaintCategory, zipCode
FROM DOB
ORDER BY complaintNumber ASC
LIMIT 10;


/* Query #4: List Top Ten Zip Codes With The Most Overall Complaints in 2018*/

SELECT zipCode,Count(zipCode) AS d
   FROM DOB
   WHERE SUBSTR(dateEntered,9,2)="18"
   GROUP BY zipCode
   ORDER BY d DESC
   LIMIT 10;

/* Query #5: Top Ten Complaint Categories Reported in 2018*/

SELECT complaintCategory,COUNT(complaintCategory) AS d
   FROM DOB
   WHERE SUBSTR(dateEntered,9,2)="18"
   GROUP BY complaintCategory
   ORDER BY d DESC
   LIMIT 10;

/* Query #6: List Top Ten zip codes with the top complaint category in 2018*/

SELECT complaintCategory,COUNT(complaintCategory) AS d
   FROM DOB
   WHERE complaintCategory = "45" AND SUBSTR(dateEntered,9,2)="18"
   GROUP BY zipCode
   ORDER BY d DESC
   LIMIT 10;

/* Query #7: Top Ten Buildings who report complaints to the DOB in 2018 in Alphabetic Order*/

SELECT houseNumber||houseStreet,zipCode,COUNT(houseNumber||houseStreet) AS d
   FROM DOB
   WHERE SUBSTR(dateEntered,9,2)="18"
   GROUP BY houseNumber||houseStreet
   HAVING d>66
   ORDER BY houseStreet ASC
   LIMIT 10;

/*Query #8: User Friendly First 15 Records in Alphabetic Order*/

SELECT dateEntered,"  Address: "||houseNumber||houseStreet||zipCode||"  Complaint Category: "||complaintCategory 
   FROM DOB
   GROUP BY complaintNumber
   HAVING complaintNumber <1000023
   ORDER BY houseStreet
   LIMIT 15;

/*Query #9 The amount of 02 complaint category listings*/

SELECT COUNT(complaintCategory)
   FROM DOB
   WHERE complaintCategory="02";

/*Query #10 The last 10 records of 02 complaint category*/

SELECT dateEntered,houseNumber,houseStreet,zipCode
   FROM DOB
   WHERE complaintCategory="02"
   ORDER BY SUBSTR( dateEntered,9,2)||SUBSTR(dateEntered,1,2)||SUBSTR(dateEntered,4,2) DESC
   LIMIT 10;

/*Query #11 List top ten buildings with DOB 02 complaints and how many they have in descending order */

SELECT houseNumber||houseStreet,unit,zipCode,COUNT(houseNumber||houseStreet) AS d
   FROM DOB
   WHERE complaintCategory="02"
   GROUP BY houseNumber||houseStreet
   ORDER BY d DESC
   LIMIT 10;

/*Query #12 List the years with 02 complaints in descending order of most complaints */

SELECT SUBSTR(dateEntered,9,2), COUNT(SUBSTR(dateEntered,9,2)) AS d
   FROM DOB
   WHERE complaintCategory="02"
   GROUP BY SUBSTR(dateEntered,9,2)
   ORDER BY d DESC;





