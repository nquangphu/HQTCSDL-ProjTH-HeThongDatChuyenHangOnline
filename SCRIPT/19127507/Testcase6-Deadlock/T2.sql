USE ONLINESHOP
GO

BEGIN TRAN
	EXEC dbo.SUA_SANPHAM @MASP = 1,  -- bigint
	                     @MALH = 1,  -- bigint
	                     @TENSP = 'phuc' -- varchar(30)
	WAITFOR DELAY '00:00:05'
	EXEC dbo.XEM_TT_DONHANG_DT @MADT = 1 -- bigint
COMMIT
	
	