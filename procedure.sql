CREATE OR ALTER PROCEDURE [DW_Fernando_Barbosa].[PA_Prices]
AS
BEGIN

    TRUNCATE TABLE [DW_Fernando_Barbosa].[Prices]

    INSERT INTO [DW_Fernando_Barbosa].[Prices]
        SELECT 
            CAST("timestamp" AS DATETIME), CAST("open" AS FLOAT), CAST("high" AS FLOAT), CAST("low" AS FLOAT), CAST("close" AS FLOAT), 'Microsoft' AS "ticker" 
        FROM [DW_Fernando_Barbosa].[Microsoft]
        UNION ALL
        SELECT 
            CAST("timestamp" AS DATETIME), CAST("open" AS FLOAT), CAST("high" AS FLOAT), CAST("low" AS FLOAT), CAST("close" AS FLOAT), 'Amazon' AS "ticker" 
        FROM [DW_Fernando_Barbosa].[AWS]
        UNION ALL
        SELECT 
            CAST("timestamp" AS DATETIME), CAST("open" AS FLOAT), CAST("high" AS FLOAT), CAST("low" AS FLOAT), CAST("close" AS FLOAT), 'Google' AS "ticker" 
        FROM [DW_Fernando_Barbosa].[Google]
END