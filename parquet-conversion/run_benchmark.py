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
    conf = (SparkConf().setAppName("SPARKTEST").setMaster("yarn-client")).set("spark.executor.instances", 32).set("spark.executor.cores", 1).set("spark.sql.parquet.compression.codec", "snappy")
    sc = SparkContext(conf=conf)
    sqlContext = SQLContext(sc)
    with benchmark("spark"):
        df = sqlContext.createDataFrame(lineorder.get_data(sc = sc, filename =  input_lineorder_filename), lineorder.get_schema())
        print df.rdd.getNumPartitions()
        df.coalesce(5).write.mode("overwrite").parquet(os.path.join("/tmp", output_lineorder_filename))
        #df.write.mode("overwrite").parquet(os.path.join("/tmp", output_lineorder_filename))
        #df.write.partitionBy("LO_OrderDateKey").mode("overwrite").parquet(os.path.join("/tmp", output_lineorder_filename))


    #shutil.rmtree(os.path.join("/tmp", output_lineorder_filename));






if __name__ == '__main__':
    benchmark_lineorder();