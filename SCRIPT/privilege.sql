USE ONLINESHOP
GO

----------------------- PHAN QUYEN TAI XE -----------------------
-----------------------------------------------------------------
EXEC sys.sp_addlogin @loginame = 'TAIXE',    -- sysname
                     @passwd = 'TAIXE',      -- sysname
                     @defdb = ONLINESHOP       -- sysname

CREATE USER USERTAIXE FOR LOGIN TAIXE

EXEC sys.sp_addrole @rolename = 'TAIXE' -- sysname
                    
EXEC sys.sp_addrolemember @rolename = 'TAIXE',  -- sysname
                          @membername = 'USERTAIXE' -- sysname
 
GRANT SELECT ON dbo.DONHANG TO TAIXE;
GRANT UPDATE ON dbo.DONHANG (TRANGTHAISHIP, TAI_MATK) TO TAIXE;

GO
---------------------- PHAN QUYEN DOI TAC -----------------------
-----------------------------------------------------------------
EXEC sys.sp_addlogin @loginame = 'DOITAC',    -- sysname
                     @passwd = 'DOITAC',      -- sysname
                     @defdb = ONLINESHOP      -- sysname
CREATE USER USERDOITAC FOR LOGIN DOITAC

EXEC sys.sp_addrole @rolename = 'DOITAC' -- sysname
EXEC sys.sp_addrolemember @rolename = 'DOITAC',  -- sysname
                          @membername = 'USERDOITAC' -- sysname

GRANT INSERT, UPDATE, DELETE ON dbo.QLSANPHAM TO DOITAC;
GRANT SELECT ON dbo.DONHANG TO DOITAC;
GRANT UPDATE ON dbo.DONHANG(TRANGTHAISHIP) TO DOITAC;

GO
--------------------- PHAN QUYEN KHACHHANG ----------------------
-----------------------------------------------------------------
EXEC sys.sp_addlogin @loginame = 'KHACHHANG',    -- sysname
                     @passwd = 'KHACHHANG',      -- sysname
                     @defdb = 'ONLINESHOP'      -- sysname
CREATE USER USERKHACHHANG FOR LOGIN KHACHHANG

EXEC sys.sp_addrole @rolename = 'KHACHHANG' -- sysname
EXEC sys.sp_addrolemember @rolename = 'KHACHHANG',  -- sysname
                          @membername = 'USERKHACHHANG' -- sysname
GRANT SELECT ON dbo.DOITAC TO KHACHHANG;
GRANT SELECT,UPDATE, DELETE ON dbo.DONHANG TO KHACHHANG;
GRANT SELECT,UPDATE, DELETE ON dbo.QLDONHANG TO KHACHHANG;
GRANT SELECT ON dbo.SANPHAM TO KHACHHANG;

GO
---------------------- PHAN QUYEN NHAN VIEN ---------------------
-----------------------------------------------------------------
EXEC sys.sp_addlogin @loginame = 'NHANVIEN',    -- sysname
                     @passwd = 'NHANVIEN',      -- sysname
                     @defdb = 'ONLINESHOP'       -- sysname
CREATE USER USERNHANVIEN FOR LOGIN NHANVIEN

EXEC sys.sp_addrole @rolename = 'NHANVIEN' -- sysname
EXEC sys.sp_addrolemember @rolename = 'NHANVIEN',  -- sysname
                          @membername = 'USERNHANVIEN' -- sysname

GRANT SELECT,UPDATE ON dbo.HOPDONG TO NHANVIEN;

GO
----------------------- PHAN QUYEN ADMIN ------------------------
-----------------------------------------------------------------
EXEC sys.sp_addlogin @loginame = 'ADMINN',    -- sysname
                     @passwd = 'ADMINN',      -- sysname
                     @defdb = 'ONLINESHOP'      -- sysname
CREATE USER USERADMINN FOR LOGIN ADMINN

EXEC sys.sp_addrole @rolename = 'ADMINN' -- sysname
EXEC sys.sp_addrolemember @rolename = 'ADMINN',  -- sysname
                          @membername = 'USERADMINN' -- sysname
GRANT UPDATE ON dbo.TAIKHOAN TO ADMINN;
GRANT UPDATE,SELECT,DELETE ON dbo.TAIKHOAN  TO ADMINN WITH GRANT OPTION;
EXEC sys.sp_addsrvrolemember @loginame = 'ADMINN', -- sysname
                             @rolename = 'securityadmin'  -- sysname





                    

                    



                    



                    

                     


                    





                     



                    




                 


