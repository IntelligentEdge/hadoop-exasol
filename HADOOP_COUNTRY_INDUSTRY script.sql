OPEN SCHEMA GM;
CREATE OR REPLACE EXTERNAL SCALAR SCRIPT "HADOOP_COUNTRY_INDUSTRY" (num DECIMAL(18,0), filename VARCHAR(2000) UTF8) EMITS (NUM DECIMAL(18,0), COUNTRY_INDUSTRY VARCHAR(2000) UTF8) AS
# redirector tcp://192.168.56.1:4050
exasol.method = input
exasol.input.splits = 1
mapred.output.dir = /output/${database_name}/${session_id}/${statement_id}
mapreduce.job.jar = /usr/lib/hadoop/EXAhadoop.jar
mapreduce.job.name = industry
mapreduce.job.map.class = exasol.hadoop.EXAIndustry$InputMapper
mapreduce.job.inputformat.class = exasol.hadoop.EXAIOFormat$Input
mapreduce.job.maxtaskfailures.per.tracker = 0
mapreduce.job.maps = 1
mapreduce.map.maxattempts = 1
/