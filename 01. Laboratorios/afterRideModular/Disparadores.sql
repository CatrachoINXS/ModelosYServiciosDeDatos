
CREATE OR REPLACE TRIGGER DP_REGISTRO_BI_numero_fecha_automaticos
BEFORE INSERT ON Registros 
FOR EACH ROW
BEGIN
    SELECT COUNT(*) + 1 INTO :NEW.numero FROM Registros;
    :NEW.fecha := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER DP_REGISTRO_BU_actualizar_registro
BEFORE UPDATE ON Registros 
FOR EACH ROW
BEGIN
    :NEW.numero := :OLD.numero;
    :NEW.fecha := :OLD.fecha;
    :NEW.tiempo := :OLD.tiempo;
    :NEW.ciclistaId := :OLD.ciclistaId;
    :NEW.versionNombre := :OLD.versionNombre;
    :NEW.segmentoNombre := :OLD.segmentoNombre;
    :NEW.dificultad := :OLD.dificultad;
END;
/

CREATE OR REPLACE TRIGGER DP_FOTOS_BU_actualizar_foto
BEFORE UPDATE ON Fotos 
FOR EACH ROW
BEGIN
    :NEW.numeroRegistro := :OLD.numeroRegistro;
END;
/

CREATE OR REPLACE TRIGGER DP_REGISTRO_BD_validacion_eliminacion
BEFORE DELETE ON Registros
FOR EACH ROW
BEGIN
    IF SYSDATE - :OLD.fecha > 1 THEN
        RAISE_APPLICATION_ERROR(-20002,'No se puede eliminar el registro: ha pasado más de un día desde su creación');
    END IF;
END;
/
