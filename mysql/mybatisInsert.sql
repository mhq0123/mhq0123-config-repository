# INSERT INTO SMS_EMAIL (
# 	EMAIL_ID,
# 	SUBJECT,
# 	EMAIL_FROM,
# 	EMAIL_TO,
# 	TEXT,
# 	TEMPLATE,
# 	TEMPLATE_VARIABLES,
# 	ATTACHMENTS,
# 	INLINES,
# 	STATUS,
# 	INST_DATE,
# 	INST_DATETIME,
# 	LUPD_DATETIME,
# ) VALUES (
# 	#{ emailId,                   jdbcType=INTEGER},
# 	#{ subject,                   jdbcType=VARCHAR},
# 	#{ emailFrom,                 jdbcType=VARCHAR},
# 	#{ emailTo,                   jdbcType=VARCHAR},
# 	#{ text,                      jdbcType=VARCHAR},
# 	#{ template,                  jdbcType=VARCHAR},
# 	#{ templateVariables,         jdbcType=VARCHAR},
# 	#{ attachments,               jdbcType=VARCHAR},
# 	#{ inlines,                   jdbcType=VARCHAR},
# 	#{ status,                    jdbcType=VARCHAR},
# 	#{ instDate,                  jdbcType=VARCHAR},
# 	#{ instDatetime,              jdbcType=TIMESTAMP},
# 	#{ lupdDatetime,              jdbcType=TIMESTAMP},
# )
SET @table_name = 'sms_email';

SELECT
	CONCAT(
			'INSERT INTO ',
			UPPER(@table_name),
			' ('
	)
FROM
	DUAL
UNION ALL
SELECT
	CONCAT(
			LPAD('', 1, '	'),
			UPPER(t.COLUMN_NAME),
			','
	)
FROM
	information_schema.`COLUMNS` t
WHERE
	UPPER(t.TABLE_NAME) = UPPER(@table_name)
UNION ALL
SELECT
	') VALUES ('
FROM
	DUAL
UNION ALL
SELECT
	CONCAT(
			LPAD('', 1, '	'),
			RPAD(
					CONCAT(
							'#{',
							-- 第一个分割
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
							),
							','
					),
					30,
					' '
			),
			'jdbcType=',
			(
				CASE t.DATA_TYPE
				WHEN 'varchar' THEN
					'VARCHAR'
				WHEN 'timestamp' THEN
					'TIMESTAMP'
				WHEN 'INT' THEN
					'INTEGER'
				WHEN 'tinyint' THEN
					'INTEGER'
				WHEN 'bigint' THEN
					'BIGINT'
				WHEN 'decimal' THEN
					'DECIMAL'
				WHEN 'char' THEN
					'VARCHAR'
				ELSE
					UPPER(t.DATA_TYPE)
				END
			),
			'},'
	)
FROM
	information_schema. COLUMNS t
WHERE
	LOWER(t.table_name) = LOWER(@table_name)
UNION ALL
SELECT
	')'
FROM
	DUAL;