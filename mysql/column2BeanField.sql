-- /** 账号索引编号*/	private int accountId;
-- /** 网络地址*/	private String networkAddress;
-- /** 现实地址*/	private String realPlace;

set @table_name = 'customer_login';
SELECT
	CONCAT(
		'/** ',
		t.COLUMN_COMMENT,
		'*/'
	),
	CONCAT(
		'private ',
		(
			CASE t.DATA_TYPE
			WHEN 'varchar' THEN
				'String'
			WHEN 'timestamp' THEN
				'Date'
			WHEN 'tinyint' THEN
				'int'
			WHEN 'bigint' THEN
				'long'
			WHEN 'decimal' THEN
				'BigDecimal'
			WHEN 'char' THEN
				'String'
			ELSE
				t.DATA_TYPE
			END
		),
		-- 第一个分割
		CONCAT(
			' ',
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
		';'
	)
FROM
	 information_schema.COLUMNS t
WHERE
	LOWER(t.table_name) = LOWER(@table_name)
ORDER BY
	t.ORDINAL_POSITION;