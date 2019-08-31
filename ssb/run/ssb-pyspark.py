import sys
from pyspark import SparkConf, SparkContext, HiveContext

if __name__ == "__main__":
	if len(sys.argv) != 4:
		print("Usage: ssb-pyspark <executor-cores> <executor-instances> <query> ")
		exit(-1)

	# Configure Spark
	conf = SparkConf().setAppName("SSBQuery").setMaster("yarn-client").set("spark.executor.instances", sys.argv[2]).set("spark.executor.cores", sys.argv[1])
	#conf = SparkConf().setAppName("SSBQuery").setMaster("local[*]")
	sc = SparkContext(conf=conf)
	sqlContext = HiveContext(sc)
	f = open(sys.argv[3])

	sql = f.read()
	print sql
	sqlContext.sql(sql).show()

	f.close()	
	sc.stop()
