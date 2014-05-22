USE ssb1000;

DROP TABLE IF EXISTS customer;
CREATE EXTERNAL TABLE  customer
(
    C_CustomerKey int ,
    C_Name String,
    C_Address String,
    C_City String,
    C_Nation String,
    C_Region String,
    C_Phone String,
    C_MktSegment String
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LOCATION '/user/alex/ssb1000/customer/';

DROP TABLE IF EXISTS part;
CREATE EXTERNAL TABLE  part
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
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LOCATION '/user/alex/ssb1000/part/';

DROP TABLE IF EXISTS supplier;
CREATE external TABLE supplier
(
    S_SuppKey int ,
    S_Name String,
    S_Address String,
    S_City String,
    S_Nation String,
    S_Region String,
    S_Phone String
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LOCATION '/user/alex/ssb1000/supplier/';
 
DROP TABLE IF EXISTS dim_date;
CREATE EXTERNAL TABLE  dim_date
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
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LOCATION '/user/alex/ssb1000/date/';

DROP TABLE IF EXISTS lineorder;
CREATE EXTERNAL TABLE lineorder
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
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LOCATION '/user/alex/ssb1000/lineorder/';
