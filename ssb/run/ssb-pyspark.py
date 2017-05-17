import sys
from pyspark import SparkConf, SparkContext, HiveContext

if __name__ == "__main__":
	if len(sys.argv) != 3:
		print("Usage: ssb-pyspark <executor-instances> <query> ")
		exit(-1)

	# Configure Spark
	#conf = SparkConf().setAppName("SSBQuery").setMaster("yarn-client").set("spark.executor.instances", sys.argv[1])
	conf = SparkConf().setAppName("SSBQuery").setMaster("local[*]")
	sc = SparkContext(conf=conf)
	sqlContext = HiveContext(sc)
	f = open(sys.argv[2])

	sql = f.read()
	print sql
	sqlContext.sql(sql).show()

	f.close()	
	sc.stop()
