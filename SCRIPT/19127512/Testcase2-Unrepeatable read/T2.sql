USE ONLINESHOP
GO
 BEGIN TRAN
	EXEC dbo.GIAHAN_HOPDONG @MAHD = 1,                     -- bigint
	                        @TGKT = '2021-12-22', -- datetime
	                        @HOAHONG = 10,                -- float
	                        @ISACEPTED = 1
COMMIT
	