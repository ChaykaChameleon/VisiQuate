﻿SELECT
  B.NAME AS 'Brand'
 ,STUFF((SELECT
      ', ' + NAME
    FROM tab_models
    WHERE ID_BRAND = B.ID
    FOR XML PATH (''))
  , 1, 2, '') 'Models'
 ,B.CEO AS 'CEO'
 ,C.NAME AS 'Country'
 ,H.NAME AS 'Headquarters'
 ,STUFF((SELECT
      ', ' + NAME
    FROM TAB_BRAND_ENGINE_TYPES AS BET
    JOIN TAB_ENGINE_TYPES AS ET
      ON BET.ID_ENGINE_TYPES = ET.ID
    WHERE ID_BRAND = B.ID
    FOR XML PATH (''))
  , 1, 2, '') AS 'Engine types'
 ,STUFF((SELECT
      ', ' + NAME
    FROM TAB_FOUNDERS AS F
    WHERE ID_BRAND = B.ID
    FOR XML PATH (''))
  , 1, 2, '') 'Founders'
 ,B.FOUNDATION AS 'Foundation'
 ,CASE B.EV
    WHEN 1 THEN 'Y'
    WHEN 0 THEN 'N'
  END AS 'EV'
 ,STUFF((SELECT
      ' ' + CONCAT(FORMAT(OI.DATE, 'yyyy: '), OI.SUMM)
    FROM TAB_OPERATING_INCOME AS OI
    WHERE ID_BRAND = B.ID
    FOR XML PATH (''))
  , 1, 0, '') AS 'Operatingincome'

FROM TAB_BRAND AS B
JOIN TAB_COUNTRY AS C
  ON C.ID_BRAND = B.ID
JOIN TAB_HEADQUARTERS AS H
  ON H.ID_BRAND = B.ID;
