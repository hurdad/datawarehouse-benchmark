from pyspark.sql.types import *

def get_schema():

    fields = [
        StructField("LO_OrderKey", LongType(), True),
        StructField("LO_LineNumber", IntegerType(), False),
        StructField("LO_CustKey", IntegerType(), False),
        StructField("LO_PartKey", IntegerType(), False),
        StructField("LO_SuppKey", IntegerType(), False),
        StructField("LO_OrderDateKey", StringType(), False),
        StructField("LO_OrderPriority", StringType(), False),
        StructField("LO_ShipPriority", StringType(), False),
        StructField("LO_Quantity", IntegerType(), False),
        StructField("LO_ExtendedPrice", IntegerType(), False),
        StructField("LO_OrdTotalPrice", IntegerType(), False),
        StructField("LO_Discount", IntegerType(), False),
        StructField("LO_Revenue", IntegerType(), False),
        StructField("LO_SupplyCost", IntegerType(), False),
        StructField("LO_Tax", IntegerType(), False),
        StructField("LO_CommitDateKey", StringType(), False),
        StructField("LO_ShipMode", StringType(), False)
    ]
    return StructType(fields)

def get_data(sc, filename):
   
    raw_csv = sc.textFile(filename)
    csv_data = raw_csv.map(lambda l: l.split("|"))
    return csv_data.map(lambda p: (
        long(p[0]), 
        int(p[1]),
        int(p[2]),
        int(p[3]),
        int(p[4]),
        p[5],
        p[6],
        p[7],
        int(p[8]),
        int(p[9]),
        int(p[10]),
        int(p[11]),
        int(p[12]),
        int(p[13]),
        int(p[14]),
        p[15],
        p[16]
        )
    )