DROP TABLE IF EXISTS customer_parquet;
CREATE EXTERNAL TABLE  customer_parquet
(
    C_CustomerKey int ,
    C_Name String,
    C_Address String,
    C_City String,
    C_Nation String,
    C_Region String,
    C_Phone String,
    C_MktSegment String
)stored as parquetfile;

DROP TABLE IF EXISTS part_parquet;
CREATE EXTERNAL TABLE  part_parquet
(
    P_PartKey int ,
    P_Name String,
    P_MFGR String,
    P_Category String,
    P_Brand String,
    P_Colour String,
    P_Type String,
    P_Size tinyint,
    P_Container String
)stored as parquetfile;

DROP TABLE IF EXISTS supplier_parquet;
CREATE external TABLE supplier_parquet
(
    S_SuppKey int ,
    S_Name String,
    S_Address String,
    S_City String,
    S_Nation String,
    S_Region String,
    S_Phone String
)stored as parquetfile;

DROP TABLE IF EXISTS dim_date_parquet;
CREATE EXTERNAL TABLE  dim_date_parquet
(
    D_DateKey int,
    D_Date String,
    D_DayOfWeek String,
    D_Month String,
    D_Year SMALLINT,
    D_YearMonthNum INT,
    D_YearMonth String,
    D_DayNumInWeek tinyint,
    D_DayNumInMonth tinyint,
    D_DayNumInYear smallint,
    D_MonthNumInYear tinyint,
    D_WeekNumInYear tinyint,
    D_SellingSeason String,
    D_LastDayInWeekFl tinyint,
    D_LastDayInMonthFl tinyint,
    D_HolidayFl tinyint,
    D_WeekDayFl tinyint
)stored as parquetfile;

DROP TABLE IF EXISTS lineorder_parquet;
CREATE EXTERNAL TABLE lineorder_parquet
(
    LO_OrderKey BIGINT,
    LO_LineNumber TINYINT,
    LO_CustKey INT,
    LO_PartKey INT,
    LO_SuppKey INT,
    LO_OrderDateKey INT ,
    LO_OrderPriority string,
    LO_ShipPriority string,
    LO_Quantity tinyint,
    LO_ExtendedPrice double,
    LO_OrdTotalPrice double,
    LO_Discount double,
    LO_Revenue double,
    LO_SupplyCost double,
    LO_Tax TINYINT,
    LO_CommitDateKey INT,
    LO_ShipMode string
)stored as parquetfile;