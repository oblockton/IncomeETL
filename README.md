### ETL Case Study Project
---
### Overview

This was a group project completed during my tenure at the UCB X Data Analysis course. The scope of the project encompass various ETL operations with Sql used our database. In this project we have decided to explore the relationship between the income and the housing price index for various regions.

### Hypothetical Use Case

In order to compare housing affordability by region for a specified time period (i.e., 2018), it is useful to create an index. One such index could be the ratio of a selected proxy for property value to a selected proxy for per capita income. That ratio can easily be calculated and visualized once all of the requisite datasets are in a centralized database.

### Data Sources

As mentioned above, the two features required to arrive at an ‘affordability index’ by region for a specified time period are house price index and regional income per capita for said region. In this case, we will be looking at these features by state for 2018, and our data
sources are:
              * Federal Housing Finance Agency (FHFA) house price index ( source )
              * Bureau of Economic Analysis (BEA) per capita regional income (source: BEA API )
              * Wikipedia state names and abbreviations ( source )
              
### Data Transformation

---

## House Price Index
 The house price index is available for download from the FHFA website as either a .txt or an .xls file that can be read into memory using Pandas.

 After having already inspected the regional income data (described in the next section), we decided to create a column identical to the one in that dataset called TimePeriod , into which we would essentially insert a concatenation of the yr and qtr columns. We then dropped every column except state,  index_sa (seasonally adjusted house price index), and TimePeriod , before exporting the result via SQL Alchemy ORM for use in the creation of our database.

## Regional Income

 The regional income data was pulled using the BEA API. Upon doing so, the resulting dataframe is immediately returned (thanks to the fabulously written Python BEA API wrapper, PyBEA)

 In addition to immediately identifying several columns that we would want to drop, we noticed that the listed GeoName for Alaska was followed by a space and an asterisk. Upon inspecting the unique values in the GeoName series, we discovered that all observations
for Hawaii were recorded similarly. Consequently, we reformatted the GeoName series thusly . We then dropped every column except DataValue (per capita regional income), GeoName (state name), and TimePeriod , before exporting the result as a .csv file for use
in the creation of our database.


## State Names and Abbreviations

The state names and abbreviations were read into memory using Pandas’ read_html method. After transformation dropping unnecessary columns, the result was exported as a .csv file for use in the creation of our database.

---
### Database Creation

 We chose to create a relational database using MySQL Workbench, due to the fact that each dataset has either a state name or abbreviation as a feature. This would allow us to join the tables together using our freshly-created table of state names and abbreviations. A mix of SQL ALchemy and SQL Workbench functions were used to port our cleaned data table into the database . Finally, we wrote a query to join the house price index and regional income data for 2018 (by state) together using state name and abbreviation and TimePeriod .
