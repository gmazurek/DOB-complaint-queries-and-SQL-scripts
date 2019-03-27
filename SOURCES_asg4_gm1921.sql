
/*CSCI_UA.60-1 - SQL Script */

/* Department of Building Complaints Received 
SOURCE
https://data.cityofnewyork.us/Housing-Development/DOB-Complaints-Received/eabe-havv/data
*/

DROP TABLE IF EXISTS DOB;
CREATE TABLE DOB (
complaintNumber integer,
status text,
dateEntered text,
houseNumber text,
zipCode integer,
houseStreet text,
BIN integer,
communityBoard integer,
specialDistrict text,
complaintCategory text,
unit text,
dispositionDate text,
dispositionCode text,
inspectionDate text,
DOBRunDate text);

.mode csv
.import DOB_Complaints_Received_asg4_gm1921.csv DOB
.mode columns
