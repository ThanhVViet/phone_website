CREATE DATABASE QuanLyDienThoai;
use QuanLyDienThoai;

CREATE TABLE Account (
    uID INT AUTO_INCREMENT PRIMARY KEY,
    user CHAR(10),
    pass CHAR(10),
    isSell BOOLEAN,
    isAdmin BOOLEAN,
    email VARCHAR(50)
);
CREATE TABLE Category (
    cid INT auto_increment NOT NULL,
    cname VARCHAR(50) NULL,
    PRIMARY KEY (cid)
);
INSERT INTO Category (cid, cname) VALUES (1, 'IPHONE');

CREATE TABLE Product (
    id INT AUTO_INCREMENT NOT NULL,
    name NVARCHAR(200) NULL,
    image NVARCHAR(500) NULL,
    price FLOAT NULL,
    title NVARCHAR(500) NULL,
    `description` NVARCHAR(255) NULL,
    cateID INT NOT NULL,
    sell_ID INT NOT NULL,
    model NVARCHAR(50) NULL,
    color NVARCHAR(50) NULL,
    delivery NVARCHAR(50) NULL,
    image2 NVARCHAR(500) NULL,
    image3 NVARCHAR(500) NULL,
    image4 NVARCHAR(500) NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cateID) REFERENCES Category(cid),
    FOREIGN KEY (sell_ID) REFERENCES Account(uID)
);
CREATE TABLE Cart (
    accountID INT NOT NULL,
    productID INT NOT NULL,
    amount INT NULL,
    maCart INT AUTO_INCREMENT NOT NULL,
    memory VARCHAR(50) NULL,
    PRIMARY KEY (maCart),
    FOREIGN KEY (accountID) REFERENCES Account(uID),
    FOREIGN KEY (productID) REFERENCES Product(id)
);
CREATE TABLE Invoice (
    maHD INT AUTO_INCREMENT NOT NULL,
    accountID INT NULL,
    tongGia FLOAT NULL,
    ngayXuat DATETIME NULL,
    PRIMARY KEY (maHD),
    FOREIGN KEY (accountID) REFERENCES Account(uID)
);

CREATE TABLE Review (
    accountID INT NULL,
    productID INT NULL,
    contentReview NVARCHAR(500) NULL,
    dateReview DATE NULL,
    maReview INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (maReview),
    FOREIGN KEY (accountID) REFERENCES Account(uID),
    FOREIGN KEY (productID) REFERENCES Product(id)
);
CREATE TABLE SoLuongDaBan (
    productID INT NULL,
    soLuongDaBan INT NULL
);
CREATE TABLE Supplier (
    idSupplier INT AUTO_INCREMENT NOT NULL,
    nameSupplier NVARCHAR(100) NULL,
    phoneSupplier NVARCHAR(50) NULL,
    emailSupplier NVARCHAR(200) NULL,
    addressSupplier NVARCHAR(200) NULL,
    cateID INT NULL,
    PRIMARY KEY (idSupplier),
    FOREIGN KEY (cateID) REFERENCES Category(cid)
);
CREATE TABLE TongChiTieuBanHang (
    userID INT NULL,
    TongChiTieu FLOAT NULL,
    TongBanHang FLOAT NULL
);


DELIMITER //

CREATE PROCEDURE proc_CapNhatSoLuongDaBan (IN p_productID INT, IN p_soLuongBanThem INT)
BEGIN
    UPDATE SoLuongDaBan SET soLuongDaBan = soLuongDaBan + p_soLuongBanThem WHERE productID = p_productID;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE proc_CapNhatTongBanHang (IN p_sell_ID INT, IN p_banHangThem FLOAT)
BEGIN
    UPDATE TongChiTieuBanHang SET TongBanHang = TongBanHang + p_banHangThem WHERE userID = p_sell_ID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE proc_CapNhatTongChiTieu (IN p_userID INT, IN p_chiTieuThem FLOAT)
BEGIN
    UPDATE TongChiTieuBanHang SET TongChiTieu = TongChiTieu + p_chiTieuThem WHERE userID = p_userID;
END //

DELIMITER ;



INSERT INTO `Account` (`uID`, `user`, `pass`, `isSell`, `isAdmin`, `email`)
VALUES (1018, 'v', '1', 1, 1, 'vietle0203@gmail.com');

INSERT INTO `Account` (`uID`, `user`, `pass`, `isSell`, `isAdmin`, `email`)
VALUES (1022, 'v4v', '1', 1, 1, 'v4v@gmail.com');

INSERT INTO `Account` (`uID`, `user`, `pass`, `isSell`, `isAdmin`, `email`)
VALUES (1019, 'cong', '0203', 1, 1, 'congviet2020@gmail.com');

INSERT INTO `Account` (`uID`, `user`, `pass`, `isSell`, `isAdmin`, `email`)
VALUES (1024, 'van', '1', 0, 0, 'meomeo6lee69@gmail.com');
INSERT INTO `Account` ( `user`, `pass`, `isSell`, `isAdmin`, `email`)
VALUES ( 'thang', '1', 0, 0, 'sukdatdiktilcum1@gmail.com');


INSERT INTO Category (cid, cname) VALUES (1, 'IPHONE');
INSERT INTO Category (cid, cname) VALUES (2, 'SAMSUNG');
INSERT INTO Category (cid, cname) VALUES (3, 'NOKIA');


INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('IPhone 14 PM', 
'https://cdn.tgdd.vn/Files/2022/12/27/1499093/iphone-14-promax-128gb-gia-bao-nhieu_1280x720-800-resize.jpg', 
180, 'IPhone 14 promax tím mộng mo ', 
'iPhone 14 Pro Max đem đến những trải nghiệm không thể tìm thấy trên  mọi thế hệ iPhone trước đó với màu Tím Deep Purple sang trọng', 
1, 1022, '2022', 'Deep Purple', 'Da Nang', 'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/meizu/Mo-ta-san-pham-iphone-14-pro-max-2.jpg',
 'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/meizu/Mo-ta-san-pham-iphone-14-pro-max-9.jpg',
 ' https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/meizu/Mo-ta-san-pham-iphone-14-pro-max-l.jpg');


INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('IPhone 13 PM', 
'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-13-pro-max.png', 
150, 'IPhone 13 promax', 
'Ngoại hình đẹp mắt, nổi bật, độ bền cũng được Apple nâng cấp trên thiết bị này. Công nghệ mặt kính mới nhất Ceramic Shield được tích hợp đem lại độ bền đáng nể', 
1, 1019, '2020', 'Blue', 'Da Nang', 'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/HaoPA/meizu/Mo-ta-san-pham-iphone-13-pro-max-2.jpg',
 'https://tintuc.dienthoaigiakho.vn/wp-content/uploads/2021/12/iphone-13-pro-max-bao-nhieu-gb-va-bo-nho-nao-phu-hop-voi-ban-1.png',
 ' https://onewaymobile.vn/upload_images/images/2021/09/23/OneWaymobile%20iPhone%2013%20Pro%20Max%20screen.jpg');
 
 INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('IPhone 14 PM', 
'https://image.anhducdigital.vn/apple/iphone/iphone-14-pro-pro-max/iphone-14-pro-max/iphone-14-pro-max-04.jpg', 
180, 'IPhone 14 promax den lịch lãm ', 
'iPhone 14 Pro Max đem đến những trải nghiệm không thể tìm thấy trên  mọi thế hệ iPhone trước đó với màu Tím Deep Purple sang trọng', 
1, 1022, '2022 128GB', 'Black', 'Da Nang', 'https://image.anhducdigital.vn/apple/iphone/iphone-14-pro-pro-max/iphone-14-pro-01.jpg',
 'https://image.anhducdigital.vn/apple/iphone/iphone-14-pro-pro-max/iphone-14-pro-11.jpg',
 'https://image.anhducdigital.vn/apple/iphone/iphone-14-pro-pro-max/iphone-14-pro-06.jpg');
 
  INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('Galaxy S23 Ultra', 
'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-thumb-xanh-600x600.jpg', 
180, 'Điện thoại Samsung Galaxy S23 Ultra 256GB', 
'Samsung Galaxy S23 Ultra 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy', 
2, 1022, '2023 256GB', 'Xanh', 'Da Nang', 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/vi-vn-samsung-galaxy-s23-ultra-3.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/man-hinh-s23-ultra-1020x570.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/samsung-galaxy-s23-ultra-1020x570.jpg');
 
   INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('Galaxy S23 Ultra', 
'https://gsmphone.co/wp-content/uploads/2023/02/SamsungGalaxyS23Ultra-3_900x.webp', 
190, 'Điện thoại Samsung Galaxy S23 Ultra 256GB', 
'Samsung Galaxy S23 Ultra 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy', 
2, 1022, '2023 256GB', 'Black', 'Da Nang', 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/vi-vn-samsung-galaxy-s23-ultra-3.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/man-hinh-s23-ultra-1020x570.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/samsung-galaxy-s23-ultra-1020x570.jpg');
    INSERT INTO `Product` 
( `name`, `image`, `price`, `title`, `description`, `cateID`, `sell_ID`, `model`, `color`, `delivery`, `image2`, `image3`, `image4`) 
VALUES 
('Galaxy S23 Ultra', 
'https://catalogo.claro.com.ec/uploads/imgs/productos/samsung-galaxy-s23-ultra-1tb/blanco/zoom/01-samsung-galaxy-s23-ultra-1tb-blanco-front.png', 
190, 'Điện thoại Samsung Galaxy S23 Ultra 256GB', 
'Samsung Galaxy S23 Ultra 256GB là chiếc smartphone cao cấp nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy', 
2, 1022, '2023 256GB', 'Yellow', 'Da Nang', 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/vi-vn-samsung-galaxy-s23-ultra-3.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/man-hinh-s23-ultra-1020x570.jpg',
 'https://cdn.tgdd.vn/Products/Images/42/249948/Slider/samsung-galaxy-s23-ultra-1020x570.jpg');


INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 999, '2023-2-12 00:00:00');
INSERT INTO Invoice (accountID, tongGia, ngayXuat) VALUES ( 1018, 800, '2023-1-12 00:00:00');
INSERT INTO Invoice (accountID, tongGia, ngayXuat) VALUES ( 1019, 400, '2023-4-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES (1019, 511.2, '2023-10-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 241.20000000000002, '2023-9-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 392.40000000000003, '2023-7-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 482.40000000000003, '2023-5-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1019, 300, '2023-3-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1019, 400, '2023-3-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 180, '2023-1-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 1079.1000000000001, '2023-10-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 122.4, '2023-6-20 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1019, 1394.1000000000001, '2023-11-12 00:00:00');
INSERT INTO Invoice ( accountID, tongGia, ngayXuat) VALUES ( 1018, 256, '2023-11-12 00:00:00');



-- Assuming "maHD" is auto-increment or identity column
INSERT INTO Invoice (accountID, tongGia, ngayXuat) VALUES (1018,599 ,'2023-2-12 00:00:00');
INSERT INTO Invoice (accountID, tongGia, ngayXuat) VALUES (1019, 600 ,'2023-1-12 00:00:00');
INSERT INTO Invoice (accountID, tongGia, ngayXuat) VALUES (1019, 400, '2023-4-12 00:00:00');


