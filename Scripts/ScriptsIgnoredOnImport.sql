
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--DROP PROCEDURE IF EXISTS generate_dataset
--GO

--select db_name()
--select * from iris
--select * from INFORMATION_SCHEMA.tables
/* */


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

DROP PROCEDURE IF EXISTS script_test
GO

CREATE PROCEDURE [script_test] @table_name varchar(30)
AS
BEGIN
  DECLARE @inquery NVARCHAR(max) = N'SELECT * from iris'
  EXEC sp_execute_external_script @language = N'R',
                                  @script = N'
dat <- InputDataSet

res <- dat[1,1]
'
,@input_data_1 = @inquery
END
;
GO

exec script_test @table_name = 'iris'