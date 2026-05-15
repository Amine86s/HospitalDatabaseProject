


CREATE TABLE HAREKET (
    hareket_id      NUMBER(12) PRIMARY KEY,
    tablo_adi       VARCHAR2(50) NOT NULL,
    islem_turu      VARCHAR2(10) NOT NULL,
    kayit_id        NUMBER(12),
    kullanici       VARCHAR2(50) DEFAULT USER,
    islem_tarihi    DATE DEFAULT SYSDATE,
    aciklama        VARCHAR2(500)
);

CREATE SEQUENCE SEQ_HAREKET START WITH 1 INCREMENT BY 1;


-- ============================================
-- 1) HASTANE TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_HASTANE
AFTER INSERT OR UPDATE OR DELETE ON HASTANE
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.h_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.h_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.h_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'HASTANE', V_ISLEM, V_ID,
            'Hastane tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 2) DEPARTMAN TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_DEPARTMAN
AFTER INSERT OR UPDATE OR DELETE ON DEPARTMAN
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.d_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.d_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.d_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'DEPARTMAN', V_ISLEM, V_ID,
            'Departman tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 3) POLIKLINIK TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_POLIKLINIK
AFTER INSERT OR UPDATE OR DELETE ON POLIKLINIK
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.pol_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.pol_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.pol_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'POLIKLINIK', V_ISLEM, V_ID,
            'Poliklinik tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 4) TIBBI_TEKNOLOJI TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_TIBBI_TEKNOLOJI
AFTER INSERT OR UPDATE OR DELETE ON TIBBI_TEKNOLOJI
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.t_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.t_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.t_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'TIBBI_TEKNOLOJI', V_ISLEM, V_ID,
            'Tıbbi teknoloji tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/


-- ============================================
-- 5) PERSONEL TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_PERSONEL
AFTER INSERT OR UPDATE OR DELETE ON PERSONEL
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.s_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.s_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.s_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'PERSONEL', V_ISLEM, V_ID,
            'Personel tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 6) DOKTOR TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_DOKTOR
AFTER INSERT OR UPDATE OR DELETE ON DOKTOR
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.dr_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.dr_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.dr_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'DOKTOR', V_ISLEM, V_ID,
            'Doktor tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 7) RANDEVU TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_RANDEVU
AFTER INSERT OR UPDATE OR DELETE ON RANDEVU
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.r_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.r_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.r_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'RANDEVU', V_ISLEM, V_ID,
            'Randevu tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 8) HASTA TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_HASTA
AFTER INSERT OR UPDATE OR DELETE ON HASTA
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.p_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.p_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.p_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'HASTA', V_ISLEM, V_ID,
            'Hasta tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 9) RECETE TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_RECETE
AFTER INSERT OR UPDATE OR DELETE ON RECETE
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.re_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.re_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.re_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'RECETE', V_ISLEM, V_ID,
            'Reçete tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 10) ODEME TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_ODEME
AFTER INSERT OR UPDATE OR DELETE ON ODEME
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.fatura_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.fatura_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.fatura_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'ODEME', V_ISLEM, V_ID,
            'Ödeme tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/


-- ============================================
-- 11) ISLEMLER TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_ISLEMLER
AFTER INSERT OR UPDATE OR DELETE ON ISLEMLER
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.islem_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.islem_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.islem_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'ISLEMLER', V_ISLEM, V_ID,
            'İşlemler tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 12) MEDIKAL_EKIPMAN TRIGGER
-- ============================================
CREATE OR REPLACE TRIGGER TR_MEDIKAL_EKIPMAN
AFTER INSERT OR UPDATE OR DELETE ON MEDIKAL_EKIPMAN
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.ekipman_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :NEW.ekipman_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.ekipman_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'MEDIKAL_EKIPMAN', V_ISLEM, V_ID,
            'Medikal ekipman tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/

-- ============================================
-- 13) BLOG_YAZİ TRIGGER (Türkçe İ ile)
-- ============================================
CREATE OR REPLACE TRIGGER TR_BLOG_YAZI
AFTER INSERT OR UPDATE OR DELETE ON BLOG_YAZİ
FOR EACH ROW
DECLARE
    V_ISLEM VARCHAR2(10);
    V_ID NUMBER;
BEGIN
    IF INSERTING THEN
        V_ISLEM := 'INSERT'; V_ID := :NEW.b_id;
    ELSIF UPDATING THEN
        V_ISLEM := 'UPDATE'; V_ID := :OLD.b_id;
    ELSIF DELETING THEN
        V_ISLEM := 'DELETE'; V_ID := :OLD.b_id;
    END IF;
    INSERT INTO HAREKET(hareket_id, tablo_adi, islem_turu, kayit_id, aciklama)
    VALUES (SEQ_HAREKET.NEXTVAL, 'BLOG_YAZI', V_ISLEM, V_ID,
            'Blog yazı tablosunda ' || V_ISLEM || ' işlemi yapıldı.');
END;
/
