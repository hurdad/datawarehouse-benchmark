import os
import subprocess
from pyspark import SparkConf, SparkContext, SQLContext
from benchmark import benchmark
import lineorder
import shutil
from pyspark.sql.functions import substring

def benchmark_lineorder():


    input_lineorder_filename = "/inbound/ssb10/lineorder/lineorder.tbl"
    output_lineorder_filename = "lineorder.parquet"


    dir_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

    # Configure Spark
    conf = (SparkConf().setAppName("SPARKTEST").setMaster("yarn-client")).set("spark.executor.instances", 32).set("spark.executor.cores", 1).set("spark.sql.parquet.compression.codec", "snappy")
    sc = SparkContext(conf=conf)
    sqlContext = SQLContext(sc)
    with benchmark("spark"):

        #df = sqlContext.read.parquet(os.path.join("/tmp", output_lineorder_filename)).repartition(30)
        #df = sqlContext.read.parquet(os.path.join("/tmp", output_lineorder_filename)).coalesce(32)
        df = sqlContext.read.parquet("/tmp/result.ssb10.parquet.snappy")

        print df.rdd.getNumPartitions()
        print df.count()

        def count_in_a_partition(idx, iterator):
          count = 0
          for _ in iterator:
            count += 1
          return idx, count

      
       # print df.repartition(30).explain(True)
        #print df.repartition(30).rdd.mapPartitionsWithIndex(count_in_a_partition).collect()
       
        #df.repartition(200).write.mode("overwrite").parquet("/tmp/lineorder.parquet2")



        df = df.withColumn("year", substring("LO_OrderDateKey", 0, 4))
        df.show()

        df.repartition(50).write.format('parquet').partitionBy('year').mode('overwrite').save("/tmp/result.ssb10.parquet.snappy.partitioned")

        #df.repartition(20).write.format('parquet').mode('overwrite').save("/tmp/lineorder.parquet4")



if __name__ == '__main__':
    benchmark_lineorder();