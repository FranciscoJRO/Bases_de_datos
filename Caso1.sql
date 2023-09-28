create table FUNCIONARIO (
    FUNCIONARIO_ID numeric (38,0) not null,
    NOMBRE varchar2(40) not null,
    AP_PATERNO varchar2(40) not null,
    AP_MATERNO varchar2(40) not null,
    CURP char(18) not null,
    RFC char(13) not null,
    constraint PK_FUNCIONARIO primary key (FUNCIONARIO_ID)
);

create table VISA (
    VISA_ID numeric (38,0) not null,
    CLAVE_VISA char (3) not null,
    FECHA_INICIO date not null,
    FECHA_TERMINO date not null,
    PERIODO_VIGENCIA varchar2 (40) not null, 
    SOLICITUD_VISA_ID numeric (38,0), 
    constraint PK_VISA primary key (VISA_ID),
    constraint FK_SOLICITUD_VISA foreign key (SOLICITUD_VISA_ID) references SOLICITUD_VISA (SOLICITUD_VISA_ID)
);


create table SOLICITANTE(
    SOLICITANTE_ID numeric(38,0) not null,
    NOMBRE varchar2(40) not null,
    AP_PATERNO varchar2(40) not null,
    AP_MATERNO varchar2(40)  null,
    CURP char(18) not null,
    OCUPACION varchar2(40),
    DIRECCION varchar2(100),
    constraint PK_SOLICITANTE primary key (SOLICITANTE_ID)

);


create table PAIS(
    PAIS_ID numeric (38,0) not null,
    SIGLAS_PAIS char(4) not null,
    NOMBRE_PAIS varchar2(40) not null,
    constraint PK_PAIS primary key (PAIS_ID)
    
);

create table ESTATUS_SOLICITUD(
    ESTATUS_SOLICITUD_ID numeric(38,0) not null,
    SIGLAS_ESTATUS char(5) not null,
    ESTATUS varchar2(40) not null,
    constraint PK_ESTATUS_SOLICITUD primary key (ESTATUS_SOLICITUD_ID)
);

create table SOLICITUD_VISA (
    SOLICITUD_VISA_ID numeric (38,0) not null,
    FECHA_SOLICITUD date not null,
    CLAVE_SOLICITUD_VISA char (10) not null,
    SOLICITANTE_ID numeric (38,0), 
    PAIS_ID numeric (38,0), 
    ESTATUS_SOLICITUD_ID numeric (38,0),
    constraint PK_SOLICITUD_VISA primary key (SOLICITUD_VISA_ID),
    constraint FK_SOLICITANTE foreign key (SOLICITANTE_ID) references SOLICITANTE (SOLICITANTE_ID),
    constraint FK_PAIS foreign key (PAIS_ID) references PAIS (PAIS_ID),
    constraint FK_ESTATUS_SOLICITUD foreign key (ESTATUS_SOLICITUD_ID) references ESTATUS_SOLICITUD(ESTATUS_SOLICITUD_ID)
);

create table SOLICITUD_VISA_FUNCIONARIO(
    SOLICITUD_VISA_FUNCIONARIO_ID varchar2(40) not null,
    SOLICITUD_VISA_ID numeric(38,0), 
    FUNCIONARIO_ID numeric(38,0), 
    constraint PK_SOLICITUD_VISA_FUNCIONARIO primary key (SOLICITUD_VISA_FUNCIONARIO_ID),
    constraint SVF_FK_SOLICITUD_VISA foreign key (SOLICITUD_VISA_ID) references SOLICITUD_VISA(SOLICITUD_VISA_ID),
    constraint SVF_FK_FUNCIONARIO foreign key (FUNCIONARIO_ID) references FUNCIONARIO(FUNCIONARIO_ID)
);

create table COPIA_VISA(
    COPIA_VISA_ID numeric(38,0) not null,
    FIRMA blob not null, 
    VISA_ID numeric(38,0) not null,
    constraint CV_FK_VISA foreign key (VISA_ID) references VISA(VISA_ID),
    constraint CV_PK_COPIA_VISA primary key (COPIA_VISA_ID,VISA_ID)
);

create table TELEFONO_SOLICITANTE(
    SOLICITANTE_ID numeric(38,0) not null, 
    TIPO varchar2(40) not null,
    NUMERO numeric(38,0) not null,
    constraint TS_PK_TELEFONO_SOLICITANTE primary key (SOLICITANTE_ID, TIPO, NUMERO), 
    constraint TS_FK_SOLICITANTE foreign key (SOLICITANTE_ID) references SOLICITANTE(SOLICITANTE_ID)
);

create table HISTORICO_STATUS_SOLICITUD_VISA(
    HISTORICO_STATUS_SOLICITUD_VISA_ID numeric(38,0) not null,
    FECHA date not null,
    ESTATUS_SOLICITUD_ID numeric(38,0), 
    SOLICITUD_VISA_ID numeric(38,0), 
    constraint PK_HISTORICO_STATUS_SOLICITUD_VISA primary key (HISTORICO_STATUS_SOLICITUD_VISA_ID),
    constraint HFK_ESTATUS_SOLICITUD foreign key (ESTATUS_SOLICITUD_ID) references ESTATUS_SOLICITUD(ESTATUS_SOLICITUD_ID),
    constraint HFK_SOLICITUD_VISA foreign key (SOLICITUD_VISA_ID) references SOLICITUD_VISA(SOLICITUD_VISA_ID)
);

