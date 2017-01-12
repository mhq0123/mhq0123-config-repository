-- 创建用户,名字为userone,密码为123456
create user userone@localhost identified by '123456';
-- 创建名字为dbone的数据库
create database dbone;
-- 授予dbone数据库的所有权限给userone用户：
grant all on dbone.* to userone;



-- 数据库栏位变bean驼峰字段
SELECT DISTINCT
	-- 第一个分割
	CONCAT(
			SUBSTRING_INDEX(LOWER(t.COLUMN_NAME), '_', 1),
			-- 出现第一个下划线，取首字母大写
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 1) = t.COLUMN_NAME,
					'',
					UPPER(
							SUBSTRING(
									LOWER(t.COLUMN_NAME),
									length(
											SUBSTRING_INDEX(t.COLUMN_NAME, '_', 1)
									) + 2,
									1
							)
					)
			),
			-- 出现第一个下划线，取首字母外字母
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 1) = t.COLUMN_NAME,
					'',
					SUBSTRING(
							LOWER(t.COLUMN_NAME),
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 1)
							) + 3,
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2)
							) - LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 1)
							) - 2
					)
			),
			-- 出现第二个下划线，取首字母大写
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2) = t.COLUMN_NAME,
					'',
					UPPER(
							SUBSTRING(
									LOWER(t.COLUMN_NAME),
									length(
											SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2)
									) + 2,
									1
							)
					)
			),
			-- 出现第二个下划线，取首字母外字母
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2) = t.COLUMN_NAME,
					'',
					SUBSTRING(
							LOWER(t.COLUMN_NAME),
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2)
							) + 3,
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3)
							) - LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 2)
							) - 2
					)
			),
			-- 出现第三个下划线，取首字母大写
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3) = t.COLUMN_NAME,
					'',
					UPPER(
							SUBSTRING(
									LOWER(t.COLUMN_NAME),
									length(
											SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3)
									) + 2,
									1
							)
					)
			),
			-- 出现第三个下划线，取首字母外字母
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3) = t.COLUMN_NAME,
					'',
					SUBSTRING(
							LOWER(t.COLUMN_NAME),
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3)
							) + 3,
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4)
							) - LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 3)
							) - 2
					)
			),
			-- 出现第四个下划线，取首字母大写
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4) = t.COLUMN_NAME,
					'',
					UPPER(
							SUBSTRING(
									LOWER(t.COLUMN_NAME),
									length(
											SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4)
									) + 2,
									1
							)
					)
			),
			-- 出现第四个下划线，取首字母外字母
			IF (
					SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4) = t.COLUMN_NAME,
					'',
					SUBSTRING(
							LOWER(t.COLUMN_NAME),
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4)
							) + 3,
							LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 5)
							) - LENGTH(
									SUBSTRING_INDEX(t.COLUMN_NAME, '_', 4)
							) - 2
					)
			)
	),
	t.COLUMN_NAME
FROM
	`COLUMNS` t
WHERE
	t.TABLE_NAME = 'COLUMNS';