USE ONLINESHOP
GO
BEGIN TRAN
	EXEC dbo.XEM_DSHD_CHUADUYET @MADT = 2 -- int
	WAITFOR DELAY '00:00:05'
	EXEC dbo.DUYET_HOPDONG @MADT = 2 -- bigint
COMMIT
-- Ta thấy được rằng ban đầu danh sách hợp đồng chưa duyệt của đối tác 2
-- chỉ hợp đồng 3 4, tuy nhiên sau khi duyệt và thông báo thời hạn thì đã
-- xuất hiện thêm hợp đồng 5, do T2 thực hiện Đăng kí hợp đồng cho đối tác 
-- sau khi T1 xem danh sách
	
	