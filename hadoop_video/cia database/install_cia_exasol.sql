/* 	
### Project:		Edge Sample Database for Exasol 
### Filename:		install_cia_exasol.sql
### Description:	Script for loading a sample CIA FACTBOOK database
###
### Coded by:		Graham Mossman - Intelligent Edge Group - 1/8/2012
###

	This script is designed to be run from the EXAplus client application.
	It requires that you enter appropriate values for the schema you are using
	and also the directory in which the .dat data files are stored 

*/
DROP TABLE &myschema..CO2;
DROP TABLE &myschema..COUNTRY;
DROP TABLE &myschema..ECONOMY;
DROP TABLE &myschema..MILITARY;
DROP TABLE &myschema..PHYSICAL;
DROP TABLE &myschema..POPULATION;
DROP TABLE &myschema..POWER;
DROP TABLE &myschema..TELECOMMUNICATION;
DROP TABLE &myschema..TRANSPORT;

CREATE TABLE &myschema..CO2
(
 COUNTRY_ID smallint,
 STATS_YEAR smallint,
 CO2_KILOTONNES decimal(18,2))
;

CREATE TABLE &myschema..COUNTRY
(
 COUNTRY_ID SMALLINT,
 COUNTRY_CODE VARCHAR(10),
 CONTINENT_NAME VARCHAR(255) ,
 COUNTRY_NAME VARCHAR(255),
 COUNTRY_NAME_FULL VARCHAR(255),
 CAPITAL VARCHAR(50),
 NATIONALITY_DETAILS VARCHAR(255),
 INTERNET_COUNTRY_CODE VARCHAR(255),
 AREA_USA_COMPARISON VARCHAR(255),
 SUFFRAGE VARCHAR(50)
)
;

CREATE TABLE &myschema..ECONOMY
 (
 COUNTRY_ID SMALLINT,
 BANK_LENDING_RATE NUMERIC(12,6),
 BUDGET BIGINT,
 CURRENT_ACCOUNT_BALANCE BIGINT,
 DEBT_EXTERNAL BIGINT,
 FOREIGN_INVESTMENT_ABROAD BIGINT,
 FOREIGN_INVESTMENT_HOME BIGINT,
 DOLLAR_EXCHANGE_RATE NUMERIC(12,6),
 DOMESTIC_CREDIT BIGINT,
 EDUCATION_EXPENDITURE NUMERIC(12,6),
 EXPORTS BIGINT,
 GDP_OFFICIAL_RATE BIGINT,
 GDP_PER_CAPITA INTEGER,
 GDP_PPP BIGINT,
 GDP_REAL_GROWTH_RATE NUMERIC(12,6),
 IMPORTS BIGINT,
 INDUSTRIAL_GROWTH NUMERIC(12,6),
 INFLATION_CONSUMER_PRICES NUMERIC(20,2),
 LABOR_FORCE INTEGER,
 MERCHANT_MARINE SMALLINT,
 SHARES_MARKET_VALUE BIGINT,
 UNEMPLOYMENT_RATE NUMERIC(12,6)
 )
;

 CREATE TABLE &myschema..MILITARY
 (
 COUNTRY_ID SMALLINT,
 MANPOWER_AVAILABLE INTEGER,
 MANPOWER_FIT INTEGER,
 MANPOWER_MILITARY_AGE INTEGER,
 MILITARY_PERCENT_GDP NUMERIC(8,2)
 )
;

 CREATE TABLE &myschema..PHYSICAL
 (
 COUNTRY_ID SMALLINT,
 AREA INTEGER,
 COASTLINE NUMERIC(12,2),
 IRRIGATED_LAND INTEGER,
 LAND_BOUNDARIES NUMERIC(12,2)
 )
;

 CREATE TABLE &myschema..POPULATION
 (
 COUNTRY_ID SMALLINT,
 POPULATION INTEGER,
 BIRTH_RATE NUMERIC(8,2),
 DEATH_RATE NUMERIC(8,2),
 POPULATION_BELOW_POVERTY_LINE NUMERIC(8,2),
 POPULATION_GROWTH_RATE NUMERIC(8,2),
 FERTILITY_RATE NUMERIC(8,2),
 HIV_AIDS_DEATHS INTEGER,
 HIV_AIDS_LIVING_WITH INTEGER,
 HIV_AIDS_RATE NUMERIC(8,2),
 INFANT_MORTALITY NUMERIC(8,2),
 MEDIAN_AGE NUMERIC(8,2),
 NET_MIGRATION_RATE NUMERIC(8,2)
 )
;

 CREATE TABLE &myschema..POWER
 (
 COUNTRY_ID SMALLINT,
 ELECTRICITY_CONSUMPTION BIGINT,
 ELECTRICITY_EXPORTS BIGINT,
 ELECTRICITY_IMPORTS BIGINT,
 ELECTRICITY_PRODUCTION BIGINT,
 GAS_CONSUMPTION BIGINT,
 GAS_EXPORTS BIGINT,
 GAS_IMPORTS BIGINT,
 GAS_PRODUCTION BIGINT,
 GAS_PROVED_RESERVES BIGINT,
 OIL_CONSUMPTION INTEGER,
 OIL_EXPORTS INTEGER,
 OIL_IMPORTS INTEGER,
 OIL_PRODUCTION INTEGER,
 OIL_PROVED_RESERVES BIGINT,
 PIPELINES INTEGER
 )
;


CREATE TABLE &myschema..TELECOMMUNICATION (
 COUNTRY_ID SMALLINT,
 INTERNET_USERS INTEGER,
 RADIO_STATIONS SMALLINT,
 TV_STATIONS SMALLINT,
 TELEPHONES INTEGER,
 TELEPHONES_MOBILE INTEGER)
;


CREATE TABLE &myschema..TRANSPORT
(
 COUNTRY_ID SMALLINT,
 AIRPORTS SMALLINT,
 HELIPORTS SMALLINT,
 RAILWAYS INTEGER,
 ROADWAYS INTEGER,
 WATERWAYS INTEGER)
;

/*
Using the fast "import" function to load the tables.

You will need to specify the directory containing the .dat data files
*/


import into &myschema..country
from local csv file '&mydatadirectory\\country.dat'
column separator='#' row separator='CRLF';
import into &myschema..co2
from local csv file '&mydatadirectory\\co2.dat'
column separator='#' row separator='CRLF';
import into &myschema..economy
from local csv file '&mydatadirectory\\economy.dat'
column separator='#' row separator='CRLF';
import into &myschema..military
from local csv file '&mydatadirectory\\military.dat'
column separator='#' row separator='CRLF';
import into &myschema..physical
from local csv file '&mydatadirectory\\physical.dat'
column separator='#' row separator='CRLF';
import into &myschema..population
from local csv file '&mydatadirectory\\population.dat'
column separator='#' row separator='CRLF';
import into &myschema..power
from local csv file '&mydatadirectory\\power.dat'
column separator='#' row separator='CRLF';
import into &myschema..telecommunication
from local csv file '&mydatadirectory\\telecommunication.dat'
column separator='#' row separator='CRLF';
import into &myschema..transport
from local csv file '&mydatadirectory\\transport.dat'
column separator='#' row separator='CRLF';
