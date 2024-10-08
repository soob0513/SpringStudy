DROP TABLE BOARD;

CREATE TABLE BOARD(
	IDX INT AUTO_INCREMENT,
	TITLE VARCHAR(255) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(50) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0, 
	PRIMARY KEY(IDX)
);
-- IMG (이미지 -> 숫자들의 모음(byte[]) -> 직렬화 -> 문자열 형식 => Base64(인코딩)
ALTER TABLE BOARD ADD COLUMN IMG LONGTEXT NOT NULL;


INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES ('10월 1일은 국군의날 임시휴무', '징검다리 휴일 신난다', '임승환');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES ('저는 배드민턴을 참으로 좋아합니다.', '배드민턴 내가 제일 잘함', '신범식');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES ('필승! 국가전략기동부대 해병대 파이팅!', '히히히히', '박병관');

COMMIT;

SELECT * FROM BOARD;