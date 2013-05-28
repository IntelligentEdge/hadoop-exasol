open schema GM;
CREATE OR REPLACE VIEW "GM"."VW_HADOOP_COUNTRY_INDUSTRY" as 
SELECT trim(regexp_substr(country_industry,'(.*)#'),'#') country_name,
trim(regexp_substr(country_industry,'#(.*)'),'#') industry
from 
(select hadoop_country_industry(1,'/home/gm/factbook/fields/2090.html'));
