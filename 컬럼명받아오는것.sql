SELECT 'private String ' || lower(column_name)|| ';'
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'MEMBER';