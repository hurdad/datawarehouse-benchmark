import os
import subprocess
from pyspark import SparkConf, SparkContext, SQLContext
from benchmark import benchmark
import lineorder
import shutil

def benchmark_lineorder():


    input_lineorder_filename = "/inbound/ssb10/lineorder/lineorder.tbl"
    output_lineorder_filename = "lineorder.parquet"


    dir_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

    # Configure Spark
    conf = (SparkConf().setAppName("SPARKTEST").setMaster("yarn-client")).set("spark.executor.instances", 8).set("spark.executor.cores", 4).set("spark.sql.parquet.compression.codec", "snappy")
    sc = SparkContext(conf=conf)
    sqlContext = SQLContext(sc)
    with benchmark("spark"):

        #df = sqlContext.read.parquet(os.path.join("/tmp", output_lineorder_filename)).repartition(30)
        #df = sqlContext.read.parquet(os.path.join("/tmp", output_lineorder_filename)).coalesce(32)
        df = sqlContext.read.parquet(os.path.join("/tmp", output_lineorder_filename))

        print df.rdd.getNumPartitions()
        print df.count()




if __name__ == '__main__':
    benchmark_lineorder();