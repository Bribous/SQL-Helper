
SELECT name "OBJETO"
      ,CASE xtype WHEN 'FN' THEN 'FUNCAO'
                  WHEN 'P'  THEN 'PROCEDURE'
                  WHEN 'TR' THEN 'TRIGGER'
                  WHEN 'V' THEN 'VIEW'
                  WHEN 'F' THEN 'CHAVE ESTRANGEIRA'
                  WHEN 'PK' THEN 'CHAVE PRIMÁRIA'
                  WHEN 'U' THEN 'TABELA'
                  ELSE  xtype END TIPO
FROM sysobjects WHERE id IN (
SELECT DISTINCT id FROM syscomments WHERE UPPER(text) LIKE UPPER('%SHELL%'))
ORDER BY 1 
