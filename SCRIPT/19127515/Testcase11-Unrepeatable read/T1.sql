USE ONLINESHOP
GO

BEGIN TRAN
	EXEC dbo.XEM_DSHD_DADUYET @MADT = 1 -- int
	WAITFOR DELAY '00:00:05'
	EXEC dbo.THONGBAO_GIAHAN @MADT = 1 -- bigint
COMMIT
	
-- Ta thấy ban đầu chỉ có 2 hợp đồng cần thông báo Gia hạn là
-- hợp đồng 1 và 2 vì khoảng cách đến ngày hôm nay (22-11-2021)
-- nhỏ hơn 10 ngày.
-- Tuy nhiên thực tế thì có thêm hợp đồng 6, vì T2 đã duyệt hợp đồng
-- 6 và vô tình hợp đồng này cũng sắp đáo hạn dẫn đến danh sách này bị
-- thay đổi đi.
	

	
	