-- -Q1-
CREATE TABLE departments (
department_id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
create_at TIMESTAMP NULL CURREMENT_TIMESTAMP
updated_at TIMESTAMP NULL CURRENMENT_TIMESTAMP ON UPDATE CURRENMENT_TIMESTAMP
);

-- -Q2-
ALTER TABLE people ADD department_id TEXT AFTER email;
ALTER TABLE people MODIFY department_id INT unsigned NULL;

-- -Q3-
INSERT INTO departments (department_id, name)
VALUES
(1, '営業'),
(2, '開発'),
(3, '経理'),
(4, '人事'),
(5, '情報システム');

INSERT INTO people (person_id, name, email, department_id, age, gender)
VALUES
(7, '佐藤たろう', 'satou@gizumo.jp', 1, 39, 1),
(8, '高橋みちお', 'takahashi@gizumo.jp', 1, 22, 1),
(0, '入江はるな', 'irie@gizumo.jp', 1, 27, 2),
(10, '加藤さえ', 'katou@gizumo@jp', 2, 53, 1),
(11, '山田りょう', 'yamada@gizumo.jp', 2, 29, 1),
(12, '木村みゆ', 'kimura@gizumo.jp', 2, 36, 2),
(13, '鈴木けんいち', 'suzuki@gizumo.jp', 2, 49, 1),
(14, '中井しんじ', 'nakai@gizumo.jp', 3, 25, 1),
(15, '井上かおり', 'inoue@gizumo.jp', 4, 30, 2),
(16, '前田ゆい', 'maeda@gizumo.jp', 5, 28, 2),

INSERT INTO reports (report_id, person_id, content)
VALUES
(1, 7, '株式会社ABCへの第一回訪問'),
(2, 8, '請求書作成（A社、B社、C社）'),
(3, 9, '郵便物の受け取り、仕分け'),
(4, 10, 'ログ解析ツールを導入して効率化'),
(5, 11, 'キャッシュ機能を追加して速度向上'),
(6, 12, 'インデックスを追加してクエリの効率化'),
(7, 13, 'UIの改善とガイド機能の追加'),
(8, 14, '書類作成やデータ入力'),
(9, 15, '20XX年度卒業予定生の一次面接'),
(10, 16, '活動に必要な情報の収集');

-- -Q4-
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;

-- -Q5-
SELECT * FROM people WHERE  gender = 1 order by age;

-- -Q6-
SELECT
`name`, `email`, `age`
-- テーブル内のname, email, ageの3つのカラム名を指定したSQL文
FROM
`people`
-- peopleというテーブルからデータを取得することを指定したSQL文
WHERE
`department_id` = 1
-- SELECT文を使ってデータを取得する時に取得するデータの条件を設定することができるSQL文、この場合はカラム名department_idが1であることが条件に設定されている
ORDER BY
`created_at`;
-- データを取得する際に指定したカラムの値を対象にソートしてから取得することができるSQL文、この場合はカラム名create_atを指定している

-- -Q7-
SELECT * FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2;
SELECT * FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1;

-- -Q8-
SELECT * FROM people WHERE department_id = 1 ORDER BY age DESC;

-- -Q9-
SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

-- -Q10-
SELECT * FROM people INNER JOIN reports ON people.person_id = reports.person_id;
-- -Q11-
SELECT p.person_id, p.name, r.content FROM people p RIGHT OUTER JOIN reports r USING (person_id) WHERE content IS NULL;