CREATE OR REPLACE
PACKAGE PC_REGISTRO 
AS
    PROCEDURE adicionarRegistro(xTiempo IN NUMBER, xPosicion IN NUMBER, xRevision IN VARCHAR, xDificultad IN VARCHAR,
    
            xComentario IN VARCHAR, xCiclistaId IN NUMBER, xVersionNombre IN VARCHAR, xSegmentoNombre IN VARCHAR);
    PROCEDURE ModificarRegistro(xNumero IN VARCHAR, xRevision IN VARCHAR, xComentario IN VARCHAR);
    
    PROCEDURE cincoSegmentosMasCortos(resultado OUT SYS_REFCURSOR);
END;
/
    
-- CRUDI
    
CREATE OR REPLACE
PACKAGE BODY PC_REGISTRO
AS
    PROCEDURE adicionarRegistro(xTiempo IN NUMBER, xPosicion IN NUMBER, xRevision IN VARCHAR, xDificultad IN VARCHAR,
                xComentario IN VARCHAR, xCiclistaId IN NUMBER, xVersionNombre IN VARCHAR, xSegmentoNombre IN VARCHAR)
    IS
    BEGIN
        INSERT INTO Registros(tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
        VALUES(xTiempo, xPosicion, xRevision, xDificultad, xComentario, xCiclistaId, xVersionNombre, xSegmentoNombre);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20999, 'Error al registrar: ' || SQLERRM);
    END;
    
    PROCEDURE ModificarRegistro(xNumero IN VARCHAR, xRevision IN VARCHAR, xComentario IN VARCHAR)
    IS
    BEGIN
        UPDATE Registros SET revision = xRevision, comentario = xComentario WHERE numero = xNumero;
        IF (SQL%ROWCOUNT = 0) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Registro no encontrado');
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20999, SQLERRM);
    END;
    
    PROCEDURE cincoSegmentosMasCortos(resultado OUT SYS_REFCURSOR) 
    IS
    BEGIN
        OPEN resultado FOR
            SELECT segmentoNombre AS Segmentos, tiempo
            FROM Registros
            ORDER BY tiempo ASC
            FETCH NEXT 5 ROWS ONLY;
    END;
END PC_REGISTRO;
/