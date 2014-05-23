CREATE TABLE customer
(
    C_CustomerKey int primary key,
    C_Name varchar(25),
    C_Address varchar(25),
    C_City varchar(10),
    C_Nation varchar(15),
    C_Region varchar(12),
    C_Phone varchar(15),
    C_MktSegment varchar(10)
);
 
CREATE TABLE part
(
    P_PartKey int primary key,
    P_Name varchar(25),
    P_MFGR varchar(10),
    P_Category varchar(10),
    P_Brand varchar(15),
    P_Colour varchar(15),
    P_Type varchar(25),
    P_Size byteint,
    P_Container char(10)
);
 

CREATE TABLE supplier
(
    S_SuppKey int primary key,
    S_Name char(25),
    S_Address varchar(25),
    S_City char(10),
    S_Nation char(15),
    S_Region char(12),
    S_Phone char(15)
);

CREATE TABLE dim_date
(
    D_DateKey int primary key,
    D_Date char(18),
    D_DayOfWeek char(9),
    D_Month char(9),
    D_Year smallint,
    D_YearMonthNum int,
    D_YearMonth char(7),
    D_DayNumInWeek byteint,
    D_DayNumInMonth byteint,
    D_DayNumInYear smallint,
    D_MonthNumInYear byteint,
    D_WeekNumInYear byteint,
    D_SellingSeason char(12),
    D_LastDayInWeekFl byteint,
    D_LastDayInMonthFl byteint,
    D_HolidayFl byteint,
    D_WeekDayFl byteint
);
 
CREATE TABLE lineorder
(
    LO_OrderKey bigint not null,
    LO_LineNumber byteint not null,
    LO_CustKey int not null,
    LO_PartKey int not null,
    LO_SuppKey int not null,
    LO_OrderDateKey int not null,
    LO_OrderPriority varchar(15),
    LO_ShipPriority char(1),
    LO_Quantity byteint,
    LO_ExtendedPrice decimal,
    LO_OrdTotalPrice decimal,
    LO_Discount decimal,
    LO_Revenue decimal,
    LO_SupplyCost decimal,
    LO_Tax byteint,
    LO_CommitDateKey int not null,
    LO_ShipMode varchar(10)
) DISTRIBUTE ON (LO_OrderDateKey);