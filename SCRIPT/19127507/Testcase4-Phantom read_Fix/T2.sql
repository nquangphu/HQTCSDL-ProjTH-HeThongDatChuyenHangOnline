USE ONLINESHOP
GO
BEGIN TRAN
	EXEC dbo.DANGKI_HOPDONG @MADT = 2,            -- bigint
	                        @TGBD = '2021-12-20', -- date
	                        @TGKT = '2022-1-30', -- date
	                        @HOAHONG = 10        -- float
	
COMMIT