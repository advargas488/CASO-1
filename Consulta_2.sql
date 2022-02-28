USE [Caso_1]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_2]    Script Date: 2/27/2022 6:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Consulta_2]
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @totalPartidos INT;

	SELECT @totalPartidos = COUNT(*)
							FROM Parties

	SELECT C.Nombre
	FROM Cantones AS C, Parties AS P, Deliverables AS D
	WHERE C.Id = D.IdCanton
	GROUP BY C.Nombre
	HAVING @totalPartidos * 0.25 >= COUNT(DISTINCT D.IdPartido);

	SET NOCOUNT OFF;
END
