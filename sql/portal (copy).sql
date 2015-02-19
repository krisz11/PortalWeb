/************ Update: Schemas ***************/

COMMENT ON SCHEMA public IS NULL;



/************ Add: Sequences ***************/

/* Autogenerated Sequences */

CREATE SEQUENCE bitacora_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE bitacora_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE credencial_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE credencial_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE recordar_me_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE recordar_me_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE usuario_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE usuario_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE usuario_credencial_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE usuario_credencial_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE categoria_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE categoria_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE dato_usuario_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE dato_usuario_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE evento_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE evento_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE evento_patrocinador_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE evento_patrocinador_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE localidad_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE localidad_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE organizacion_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE organizacion_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE patrocinador_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE patrocinador_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE recaudo_economico_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE recaudo_economico_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE tipo_documento_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE tipo_documento_id_seq IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE usuario_gusta_categoria_id_seq INCREMENT BY 1;
COMMENT ON SEQUENCE usuario_gusta_categoria_id_seq IS 'DbWrench Autogenerated Sequence.';


/************ Update: Tables ***************/

/******************** Add Table: bitacora ************************/

/* Build Table Structure */
CREATE TABLE bitacora
(
	id BIGINT DEFAULT nextval('public.bitacora_id_seq'::regclass) NOT NULL,
	usuario_id BIGINT NOT NULL,
	accion VARCHAR(80) NOT NULL,
	tabla VARCHAR(80) NOT NULL,
	registro BIGINT NULL,
	observacion VARCHAR(1024) NULL,
	fecha TIMESTAMP DEFAULT now() NOT NULL
);

/* Add Primary Key */
ALTER TABLE bitacora ADD CONSTRAINT pkbitacora
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "bitacora_fecha_Idx" ON bitacora (fecha);

CREATE INDEX "bitacora_usuario_id_Idx" ON bitacora (usuario_id);


/******************** Add Table: credencial ************************/

/* Build Table Structure */
CREATE TABLE credencial
(
	id BIGINT DEFAULT nextval('public.credencial_id_seq'::regclass) NOT NULL,
	nombre VARCHAR(80) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL
);

/* Add Primary Key */
ALTER TABLE credencial ADD CONSTRAINT pkcredencial
	PRIMARY KEY (id);


/******************** Add Table: recordar_me ************************/

/* Build Table Structure */
CREATE TABLE recordar_me
(
	id BIGINT DEFAULT nextval('public.recordar_me_id_seq'::regclass) NOT NULL,
	usuario_id BIGINT NOT NULL,
	ip_address VARCHAR(50) NOT NULL,
	hash_cookie VARCHAR(32) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL
);

/* Add Primary Key */
ALTER TABLE recordar_me ADD CONSTRAINT pkrecordar_me
	PRIMARY KEY (id);

/* Add Indexes */
CREATE UNIQUE INDEX "recordar_me_ip_address_hash_cookie_Idx" ON recordar_me (ip_address, hash_cookie);

CREATE INDEX "recordar_me_usuario_id_Idx" ON recordar_me (usuario_id);


/******************** Add Table: usuario ************************/

/* Build Table Structure */
CREATE TABLE usuario
(
	id BIGINT DEFAULT nextval('public.usuario_id_seq'::regclass) NOT NULL,
	user_name VARCHAR(80) NOT NULL,
	password VARCHAR(32) NOT NULL,
	actived BOOL DEFAULT 't' NOT NULL,
	last_login_at TIMESTAMP NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL
);

/* Add Primary Key */
ALTER TABLE usuario ADD CONSTRAINT pkusuario
	PRIMARY KEY (id);

/* Add Comments */
COMMENT ON COLUMN usuario.actived IS 'TRUE = activado | FALSE = desactivado';

/* Add Indexes */
CREATE INDEX "usuario_actived_Idx" ON usuario (actived);

CREATE INDEX "usuario_deleted_at_Idx" ON usuario (deleted_at);

CREATE UNIQUE INDEX "usuario_user_name_Idx" ON usuario (user_name);

CREATE INDEX "usuario_user_name_password_Idx" ON usuario (user_name, password);


/******************** Add Table: usuario_credencial ************************/

/* Build Table Structure */
CREATE TABLE usuario_credencial
(
	id BIGINT DEFAULT nextval('public.usuario_credencial_id_seq'::regclass) NOT NULL,
	usuario_id BIGINT NOT NULL,
	credencial_id BIGINT NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL
);

/* Add Primary Key */
ALTER TABLE usuario_credencial ADD CONSTRAINT pkusuario_credencial
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "usuario_credencial_credencial_id_Idx" ON usuario_credencial (credencial_id);

CREATE INDEX "usuario_credencial_usuario_id_Idx" ON usuario_credencial (usuario_id);

CREATE UNIQUE INDEX "usuario_credencial_usuario_id_credencial_id_Idx" ON usuario_credencial (usuario_id, credencial_id);

/****************************Categoria**************************************/


CREATE TABLE categoria
(
	id INTEGER DEFAULT nextval('public.categoria_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	nombre VARCHAR(45) NOT NULL
);

/* Add Primary Key */
ALTER TABLE categoria ADD CONSTRAINT pkcategoria
	PRIMARY KEY (id);



/****************************Dato_usuario**************************************/

/* Build Table Structure */
CREATE TABLE dato_usuario
(
	id INTEGER DEFAULT nextval('public.dato_usuario_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	usuario_id INTEGER NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	apellido VARCHAR(45) NOT NULL,
	correo VARCHAR(70) NOT NULL,
	genero BOOL NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	localidad_id INTEGER NOT NULL,
	tipo_documento_id INTEGER NOT NULL,
	organizacion_id INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE dato_usuario ADD CONSTRAINT pkdato_usuario
	PRIMARY KEY (id);

/* Add Comments */
COMMENT ON COLUMN dato_usuario.genero IS 'true = femenino | false = masculino';

/* Add Indexes */
CREATE INDEX "dato_usuario_localidad_id_Idx" ON dato_usuario (localidad_id);

CREATE INDEX "dato_usuario_organizacion_id_Idx" ON dato_usuario (organizacion_id);

CREATE INDEX "dato_usuario_tipo_documento_id_Idx" ON dato_usuario (tipo_documento_id);

CREATE UNIQUE INDEX "dato_usuario_usuario_id_Idx" ON dato_usuario (usuario_id);


/*****************************Evento***********************************/

/* Build Table Structure */
CREATE TABLE evento
(
	id INTEGER DEFAULT nextval('public.evento_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	imagen VARCHAR(37) NULL,
	nombre VARCHAR(45) NOT NULL,
	descripcion VARCHAR(1024) NOT NULL,
	fecha_inicial_evento TIMESTAMP NOT NULL,
	fecha_final_evento TIMESTAMP NOT NULL,
	lugar_latitud VARCHAR(100) NOT NULL,
	lugar_longitud VARCHAR(100) NOT NULL,
	direccion VARCHAR(150) NOT NULL,
	costo INTEGER DEFAULT 0 NULL,
	usuario_id INTEGER NOT NULL,
	categoria_id INTEGER NULL,
	fecha_inicial_publicacion TIMESTAMP NOT NULL,
	fecha_final_publicacion TIMESTAMP NOT NULL
);

/* Add Primary Key */
ALTER TABLE evento ADD CONSTRAINT pkevento
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "evento_categoria_id_Idx" ON evento (categoria_id);

CREATE INDEX "evento_usuario_id_Idx" ON evento (usuario_id);


/****************Evento_patrocinador****************/


/* Build Table Structure */
CREATE TABLE evento_patrocinador
(
	id INTEGER DEFAULT nextval('public.evento_patrocinador_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	evento_id INTEGER NOT NULL,
	patrocinador_id INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE evento_patrocinador ADD CONSTRAINT pkevento_patrocinador
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "evento_patrocinador_evento_id_Idx" ON evento_patrocinador (evento_id);

CREATE UNIQUE INDEX "evento_patrocinador_evento_id_patrocinador_id_Idx" ON evento_patrocinador (evento_id, patrocinador_id);

CREATE INDEX "evento_patrocinador_patrocinador_id_Idx" ON evento_patrocinador (patrocinador_id);





/************Localidad**********************/

/* Build Table Structure */
CREATE TABLE localidad
(
	id INTEGER DEFAULT nextval('public.localidad_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	nombre VARCHAR(45) NOT NULL,
	localidad_id INTEGER NULL
);

/* Add Primary Key */
ALTER TABLE localidad ADD CONSTRAINT pklocalidad
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "localidad_localidad_id_Idx" ON localidad (localidad_id);



/*****************************Organizacion***********************/

/* Build Table Structure */
CREATE TABLE organizacion
(
	id INTEGER DEFAULT nextval('public.organizacion_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	nombre VARCHAR(45) NOT NULL,
	direccion VARCHAR(200) NOT NULL,
	telefono VARCHAR(45) NOT NULL,
	fax VARCHAR(45) NULL,
	correo VARCHAR(100) NOT NULL,
	pagina_web VARCHAR(100) NULL
);

/* Add Primary Key */
ALTER TABLE organizacion ADD CONSTRAINT pkorganizacion
	PRIMARY KEY (id);



/******************** Add Table: patrocinador ************************/

/* Build Table Structure */
CREATE TABLE patrocinador
(
	id INTEGER DEFAULT nextval('public.patrocinador_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	nombre VARCHAR(45) NOT NULL,
	telefono VARCHAR(10) NULL,
	correo VARCHAR(150) NOT NULL,
	direccion VARCHAR(150) NULL
);

/* Add Primary Key */
ALTER TABLE patrocinador ADD CONSTRAINT pkpatrocinador
	PRIMARY KEY (id);


/******************** Add Table: recaudo_economico ************************/

/* Build Table Structure */
CREATE TABLE recaudo_economico
(
	id INTEGER DEFAULT nextval('public.recaudo_economico_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	evento_id INTEGER NOT NULL,
	usuario_id INTEGER NOT NULL,
	observacion VARCHAR(1024) NULL
);

/* Add Primary Key */
ALTER TABLE recaudo_economico ADD CONSTRAINT pkrecaudo_economico
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "recaudo_economico_evento_id_Idx" ON recaudo_economico (evento_id);

CREATE INDEX "recaudo_economico_usuario_id_Idx" ON recaudo_economico (usuario_id);


/******************** Add Table: tipo_documento ************************/

/* Build Table Structure */
CREATE TABLE tipo_documento
(
	id INTEGER DEFAULT nextval('public.tipo_documento_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	deleted_at TIMESTAMP NULL,
	nombre VARCHAR(45) NOT NULL
);

/* Add Primary Key */
ALTER TABLE tipo_documento ADD CONSTRAINT pktipo_documento
	PRIMARY KEY (id);

/******************** Add Table: usuario_gusta_categoria ************************/

/* Build Table Structure */
CREATE TABLE usuario_gusta_categoria
(
	id INTEGER DEFAULT nextval('public.usuario_gusta_categoria_id_seq'::regclass) NOT NULL,
	created_at TIMESTAMP DEFAULT now() NOT NULL,
	updated_at TIMESTAMP DEFAULT now() NOT NULL,
	usuario_id INTEGER NOT NULL,
	categoria_id INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE usuario_gusta_categoria ADD CONSTRAINT pkusuario_gusta_categoria
	PRIMARY KEY (id);

/* Add Indexes */
CREATE INDEX "usuario_gusta_categoria_categoria_id_Idx" ON usuario_gusta_categoria (categoria_id);

CREATE INDEX "usuario_gusta_categoria_usuario_id_Idx" ON usuario_gusta_categoria (usuario_id);

CREATE UNIQUE INDEX "usuario_gusta_categoria_usuario_id_categoria_id_Idx" ON usuario_gusta_categoria (usuario_id, categoria_id);


/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_bitacora_usuario */
ALTER TABLE bitacora ADD CONSTRAINT fk_bitacora_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_recordar_me_usuario */
ALTER TABLE recordar_me ADD CONSTRAINT fk_recordar_me_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_usuario_credencial_credencial */
ALTER TABLE usuario_credencial ADD CONSTRAINT fk_usuario_credencial_credencial
	FOREIGN KEY (credencial_id) REFERENCES credencial (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_usuario_credencial_usuario */
ALTER TABLE usuario_credencial ADD CONSTRAINT fk_usuario_credencial_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_dato_usuario_localidad */
ALTER TABLE dato_usuario ADD CONSTRAINT fk_dato_usuario_localidad
	FOREIGN KEY (localidad_id) REFERENCES localidad (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_dato_usuario_organizacion */
ALTER TABLE dato_usuario ADD CONSTRAINT fk_dato_usuario_organizacion
	FOREIGN KEY (organizacion_id) REFERENCES organizacion (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_dato_usuario_tipo_documento */
ALTER TABLE dato_usuario ADD CONSTRAINT fk_dato_usuario_tipo_documento
	FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_dato_usuario_usuario */
ALTER TABLE dato_usuario ADD CONSTRAINT fk_dato_usuario_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_evento_categoria */
ALTER TABLE evento ADD CONSTRAINT fk_evento_categoria
	FOREIGN KEY (categoria_id) REFERENCES categoria (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_evento_usuario */
ALTER TABLE evento ADD CONSTRAINT fk_evento_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_evento_patrocinador_evento */
ALTER TABLE evento_patrocinador ADD CONSTRAINT fk_evento_patrocinador_evento
	FOREIGN KEY (evento_id) REFERENCES evento (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_evento_patrocinador_patrocinador */
ALTER TABLE evento_patrocinador ADD CONSTRAINT fk_evento_patrocinador_patrocinador
	FOREIGN KEY (patrocinador_id) REFERENCES patrocinador (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;
/* Add Foreign Key: fk_localidad_localidad */
ALTER TABLE localidad ADD CONSTRAINT fk_localidad_localidad
	FOREIGN KEY (localidad_id) REFERENCES localidad (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_recaudo_economico_evento */
ALTER TABLE recaudo_economico ADD CONSTRAINT fk_recaudo_economico_evento
	FOREIGN KEY (evento_id) REFERENCES evento (id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_recaudo_economico_usuario */
ALTER TABLE recaudo_economico ADD CONSTRAINT fk_recaudo_economico_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_usuario_gusta_categoria_categoria */
ALTER TABLE usuario_gusta_categoria ADD CONSTRAINT fk_usuario_gusta_categoria_categoria
	FOREIGN KEY (categoria_id) REFERENCES categoria (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

/* Add Foreign Key: fk_usuario_gusta_categoria_usuario */
ALTER TABLE usuario_gusta_categoria ADD CONSTRAINT fk_usuario_gusta_categoria_usuario
	FOREIGN KEY (usuario_id) REFERENCES usuario (id)
	ON UPDATE RESTRICT ON DELETE RESTRICT;

-- ----------------------------
--  Records of "credencial"
-- ----------------------------
BEGIN;
INSERT INTO "credencial" (nombre) VALUES ('admin');
INSERT INTO "credencial" (nombre) VALUES ('usuario');
COMMIT;

-- ----------------------------
--  Records of "usuario" admin - 123
-- ----------------------------
BEGIN;
INSERT INTO "usuario" (user_name, password, actived, last_login_at) VALUES ('admin', '202cb962ac59075b964b07152d234b70', 't', null);
COMMIT;

-- ----------------------------
--  Records of "usuario_credencial"
-- ----------------------------
BEGIN;
INSERT INTO "usuario_credencial" (usuario_id, credencial_id) VALUES (1, 1);
COMMIT;