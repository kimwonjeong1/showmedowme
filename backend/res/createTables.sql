use showmedowme_db;
-- 테이블 생성하기
-- 회원 유저 테이블
CREATE TABLE USERS (
	user_id			INT8 NOT NULL AUTO_INCREMENT,
	user_nickname	VARCHAR(200),
	user_pw			VARCHAR(500),
	user_birth		DATETIME,
	user_gender		INT,
	user_memo		TEXT,
    PRIMARY KEY(user_id),
    CHECK(user_gender in (0, 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 상품 분류 테이블
CREATE TABLE PRODUCTS_CATEGORIES (
	category_id		INT8 NOT NULL AUTO_INCREMENT,
    category_name	VARCHAR(500),
	PRIMARY KEY(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 생필품 테이블
CREATE TABLE DAILY_PRODUCTS (
	user_id			INT8,
    category_id		INT8,
    past_date		DATETIME,
    cycle_date		DATETIME,
    PRIMARY KEY (user_id, category_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (category_id) REFERENCES PRODUCTS_CATEGORIES(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 영수증
CREATE TABLE RECEIPTS (
	receipts_date	DATETIME,
    user_id			INT8,
    shopping_list	TEXT,
    check_time		BOOLEAN,
    check_money		BOOLEAN,
    PRIMARY KEY (receipts_date),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;