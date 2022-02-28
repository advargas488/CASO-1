USE [Caso_1]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_1]    Script Date: 2/27/2022 6:16:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Consulta_1]
	-- Add the parameters for the stored procedure here
	 @Canton VARCHAR(20)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @idCanton INT

	SELECT @idCanton = Id 
					   FROM Cantones AS C
					   WHERE C.Nombre = @Canton;
	
	SELECT D.IdPartido, D.IdAction, D.IdCanton, D.IdPlan, D.PostTime
		FROM Deliverables AS D
		WHERE D.IdCanton = @idCanton
	GROUP BY D.IdPartido ,D.IdAction, D.IdCanton, D.IdPlan, D.PostTime

	SET NOCOUNT OFF;
END
