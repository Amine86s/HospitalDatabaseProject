
CREATE TABLE HASTANE (
    h_id        NUMBER(5) PRIMARY KEY,
    h_adi       VARCHAR2(100) NOT NULL,
    h_adresi    VARCHAR2(200),
    h_tel       VARCHAR2(20),
    h_vergino   VARCHAR2(20)
);


CREATE TABLE DEPARTMAN (
    d_id        NUMBER(5) PRIMARY KEY,
    h_id        NUMBER(5) NOT NULL,
    d_adi       VARCHAR2(100) NOT NULL,
    d_konum     VARCHAR2(100),
    d_butce     NUMBER(12,2)
);

CREATE TABLE POLIKLINIK (
    pol_id      NUMBER(5) PRIMARY KEY,
    pol_adi     VARCHAR2(100) NOT NULL,
    pol_no      VARCHAR2(20),
    pol_konum   VARCHAR2(20),
    kapasite    NUMBER(3)
);

CREATE TABLE TIBBI_TEKNOLOJI (
    t_id        NUMBER(5) PRIMARY KEY,
    h_id        NUMBER(5) NOT NULL,
    t_adi       VARCHAR2(100) NOT NULL,
    t_tur       VARCHAR2(50)
);


CREATE TABLE PERSONEL (
    s_id        NUMBER(7) PRIMARY KEY,
    d_id        NUMBER(5),
    s_adi       VARCHAR2(50) NOT NULL,
    s_unvan     VARCHAR2(50),
    s_iletisim  VARCHAR2(100)
);


CREATE TABLE DOKTOR (
    dr_id       NUMBER(7) PRIMARY KEY,
    pol_id      NUMBER(7),
    dr_adi      VARCHAR2(50) NOT NULL,
    uzmanlik    VARCHAR2(100),
    tc_no       VARCHAR2(11) UNIQUE,
    dr_iletisim    VARCHAR2(100)
);

CREATE TABLE RANDEVU (
    r_id        NUMBER(9) PRIMARY KEY,
    dr_id       NUMBER(7) NOT NULL,
    r_tarih     DATE NOT NULL,
    r_durum     VARCHAR2(30) DEFAULT 'Bekliyor'
);

CREATE TABLE HASTA (
    p_id        NUMBER(7) PRIMARY KEY,
    p_adi       VARCHAR2(50) NOT NULL,
    p_cinsiyet  CHAR(1) CHECK (p_cinsiyet IN ('E','K')),
    p_dogum       DATE,
    p_adres    VARCHAR2(200),
    p_iletisim   VARCHAR2(20),
    p_kangrubu   VARCHAR2(5)
);

CREATE TABLE RECETE (
    re_id        NUMBER(9) PRIMARY KEY,
    r_id         NUMBER(9),
    ilac_ad      VARCHAR2(30),
    sure         DATE,
    talimat      VARCHAR2(30),
    doz          VARCHAR2(20)
);


CREATE TABLE ODEME (
    fatura_id   NUMBER(7) PRIMARY KEY,
    o_yontem    VARCHAR2(100) NOT NULL,
    onay        VARCHAR2(50),
    evrak_no    NUMBER(30),
    tutar       NUMBER(30),
    o_tarih     DATE
);

CREATE TABLE ISLEMLER (
    islem_id    NUMBER(9) PRIMARY KEY,
    r_id  NUMBER(9),
    islem_turu  VARCHAR2(10)
);

CREATE TABLE MEDIKAL_EKIPMAN (
    ekipman_id  NUMBER(7) PRIMARY KEY,
    d_id        NUMBER(5),
    ekipman_ad VARCHAR2(100) NOT NULL,
    bakim      VARCHAR2(50)
);


CREATE TABLE BLOG_YAZİ (
    b_id      NUMBER(9) PRIMARY KEY,
    dr_id     NUMBER(7),
    icerik   VARCHAR2(50),
    baslik  VARCHAR2(20),
    yayin_tarih DATE
);   
