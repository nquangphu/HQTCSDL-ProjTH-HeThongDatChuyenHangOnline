USE ONLINESHOP
GO
BEGIN TRAN
	EXEC dbo.DANGKI_HOPDONG @MADT = 2,            -- bigint
	                        @TGBD = '2021-11-22', -- date
	                        @TGKT = '2021-11-30', -- date
	                        @HOAHONG = 10        -- float
	
COMMIT