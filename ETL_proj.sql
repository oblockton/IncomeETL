create database hpi_db;

use hpi_db;

drop table hip_tab;

select * from hpi_db.states;

create table  states(
id INTEGER(11) AUTO_INCREMENT NOT NULL,
Name VARCHAR(20),
Abbreviation VARCHAR(2),
PRIMARY KEY (id)
);

drop table states;

create table  states(
id INTEGER(11) AUTO_INCREMENT NOT NULL,
Name VARCHAR(20),
Abbreviation VARCHAR(2),
PRIMARY KEY (id)
);

SELECT
   hpi_table.index_sa,
   bea_table.DataValue,
   hpi_table.state,
   bea_table.TimePeriod
FROM
   hpi_table
       JOIN
   states ON states.Abbreviation = hpi_table.state
       JOIN
   bea_table ON bea_table.GeoName = states.Name
        WHERE
    hpi_table.TimePeriod = bea_table.TimePeriod;