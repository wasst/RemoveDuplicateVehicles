﻿CREATE PROCEDURE [spMyObject_insert]
	(@MyKeyField_1 	[int] output,
	 @MyListField_2 	[nvarchar](50),
	 @MyField01_3 	[nvarchar](50),
	 @MyField02_4 	[nvarchar](50),
	 @MyField03_5 	[nvarchar](50),
	 @MyField04_6 	[nvarchar](50),
	 @MyField05_7 	[nvarchar](50),
	 @MyField06_8 	[nvarchar](50),
	 @MyField07_9 	[nvarchar](50),
	 @MyField08_10 	[nvarchar](50),
	 @Myfield09_11 	[nvarchar](50),
	 @MyField10_12 	[nvarchar](50),
	 @MyField11_13 	[nvarchar](50),
	 @MyField12_14 	[nvarchar](50),
	 @MyField13_15 	[nvarchar](50),
	 @MyField14_16 	[nvarchar](50),
	 @MyField15_17 	[nvarchar](50),
	 @MyField16_18 	[nvarchar](50),
	 @MyField17_19 	[nvarchar](50),
	 @MyField18_20 	[nvarchar](50),
	 @MyField19_21 	[nvarchar](50),
	 @MyField20_22 	[nvarchar](50))

AS 

Set @MyKeyField_1 = (Select IsNull(Max(MyKeyField), 0) + 1 from tblMyObject)

INSERT INTO [HCCApps].[dbo].[tblMyObject] 
	 ( [MyKeyField],
	 [MyListField],
	 [MyField01],
	 [MyField02],
	 [MyField03],
	 [MyField04],
	 [MyField05],
	 [MyField06],
	 [MyField07],
	 [MyField08],
	 [Myfield09],
	 [MyField10],
	 [MyField11],
	 [MyField12],
	 [MyField13],
	 [MyField14],
	 [MyField15],
	 [MyField16],
	 [MyField17],
	 [MyField18],
	 [MyField19],
	 [MyField20]) 
 
VALUES 
	( @MyKeyField_1,
	 @MyListField_2,
	 @MyField01_3,
	 @MyField02_4,
	 @MyField03_5,
	 @MyField04_6,
	 @MyField05_7,
	 @MyField06_8,
	 @MyField07_9,
	 @MyField08_10,
	 @Myfield09_11,
	 @MyField10_12,
	 @MyField11_13,
	 @MyField12_14,
	 @MyField13_15,
	 @MyField14_16,
	 @MyField15_17,
	 @MyField16_18,
	 @MyField17_19,
	 @MyField18_20,
	 @MyField19_21,
	 @MyField20_22)