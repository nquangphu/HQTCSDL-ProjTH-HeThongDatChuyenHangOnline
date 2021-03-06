USE ONLINESHOP
GO

BEGIN TRAN
	DECLARE @MADH AS BIGINT, @GIASP AS DECIMAL(15,2), @PHISP AS DECIMAL(15,2), @TONGTIEN AS DECIMAL(15,2)
	SELECT @GIASP=GIASP FROM dbo.QLSANPHAM WHERE MASP=1 AND MADT=1
	SET @PHISP=@GIASP*15
	SET @TONGTIEN= @PHISP+10000

	DECLARE @MADH1 BIGINT;
	EXEC dbo.TAO_DONHANG @MAKH = 2,                        -- bigint
	                     @MADT = 1,                        -- bigint
	                     @MATX = NULL,                        -- bigint
	                     @HINHTHUCTT = 'CARD',                 -- varchar(20)
	                     @NGAYTAO = '2021-11-21 13:20:04', -- datetime
	                     @DIACHIGH = 'QUAN 11',                   -- varchar(100)
	                     @PHISP =@PHISP,                    -- decimal(15, 2)
	                     @PHISHIP = 15000,                  -- decimal(15, 2)
	                     @TONGTIEN = @TONGTIEN,                 -- decimal(15, 2)
	                     @TRANGTHAISHIP = 0,               -- int
	                     @TRANGTHAITTOAN = 0,           -- bit
	                     @MADH = @MADH1 OUTPUT             -- bigint
	DECLARE @SLSPCC AS INT
	SELECT @SLSPCC= SLCUNGCAP FROM dbo.QLSANPHAM WHERE MADT=1 AND MASP=1

	WAITFOR DELAY '00:00:05'

	IF (15>@SLSPCC)
		BEGIN
		    RAISERROR('số lượng sp không đủ',15,1)
			ROLLBACK
		END
	ELSE
		BEGIN
			EXEC dbo.THEMSANPHAM @MADH = @MADH1,     -- bigint
								@MASP = 1,     -- bigint
								@GIASP = @GIASP, -- decimal(15, 2)
								@SLSP = 10,      -- int
								@MADT=1
			COMMIT
		END
EXEC dbo.XEM_DS_DONHANG_DT @MADT = 1 -- bigint

