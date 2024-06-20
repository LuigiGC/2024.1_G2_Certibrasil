PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2024-06-07 20:31:23.916241');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2024-06-07 20:31:23.935666');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2024-06-07 20:31:23.950102');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2024-06-07 20:31:23.962083');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2024-06-07 20:31:23.968696');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2024-06-07 20:31:23.997908');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2024-06-07 20:31:24.012824');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2024-06-07 20:31:24.029391');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2024-06-07 20:31:24.040749');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2024-06-07 20:31:24.051449');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2024-06-07 20:31:24.055449');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2024-06-07 20:31:24.062871');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2024-06-07 20:31:24.074426');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2024-06-07 20:31:24.083533');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2024-06-07 20:31:24.094638');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2024-06-07 20:31:24.100470');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2024-06-07 20:31:24.112174');
INSERT INTO django_migrations VALUES(18,'mapa','0001_initial','2024-06-07 20:31:24.123894');
INSERT INTO django_migrations VALUES(19,'sessions','0001_initial','2024-06-07 20:31:24.134340');
INSERT INTO django_migrations VALUES(20,'mapa','0002_empresa_remove_endereco_cliente_and_more','2024-06-10 17:27:09.330875');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO django_admin_log VALUES(1,'33','teste1',1,'[{"added": {}}]',10,2,'2024-06-17 10:24:40.495931');
INSERT INTO django_admin_log VALUES(2,'34','teste2',1,'[{"added": {}}]',10,2,'2024-06-17 10:25:06.557621');
INSERT INTO django_admin_log VALUES(3,'35','teste3',1,'[{"added": {}}]',10,2,'2024-06-17 10:28:38.005207');
INSERT INTO django_admin_log VALUES(4,'14','ISO object (14)',1,'[{"added": {}}]',11,2,'2024-06-17 10:29:26.783058');
INSERT INTO django_admin_log VALUES(5,'15','ISO object (15)',1,'[{"added": {}}]',11,2,'2024-06-17 10:29:56.713267');
INSERT INTO django_admin_log VALUES(6,'16','ISO object (16)',1,'[{"added": {}}]',11,2,'2024-06-17 10:30:31.251133');
INSERT INTO django_admin_log VALUES(7,'17','Endereco object (17)',1,'[{"added": {}}]',9,2,'2024-06-17 10:32:37.605158');
INSERT INTO django_admin_log VALUES(8,'18','Endereco object (18)',1,'[{"added": {}}]',9,2,'2024-06-17 10:33:11.405178');
INSERT INTO django_admin_log VALUES(9,'19','Endereco object (19)',1,'[{"added": {}}]',9,2,'2024-06-17 10:33:44.751278');
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'mapa','cliente');
INSERT INTO django_content_type VALUES(8,'mapa','certificacao');
INSERT INTO django_content_type VALUES(9,'mapa','endereco');
INSERT INTO django_content_type VALUES(10,'mapa','empresa');
INSERT INTO django_content_type VALUES(11,'mapa','iso');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_cliente','Can add cliente');
INSERT INTO auth_permission VALUES(26,7,'change_cliente','Can change cliente');
INSERT INTO auth_permission VALUES(27,7,'delete_cliente','Can delete cliente');
INSERT INTO auth_permission VALUES(28,7,'view_cliente','Can view cliente');
INSERT INTO auth_permission VALUES(29,8,'add_certificacao','Can add certificacao');
INSERT INTO auth_permission VALUES(30,8,'change_certificacao','Can change certificacao');
INSERT INTO auth_permission VALUES(31,8,'delete_certificacao','Can delete certificacao');
INSERT INTO auth_permission VALUES(32,8,'view_certificacao','Can view certificacao');
INSERT INTO auth_permission VALUES(33,9,'add_endereco','Can add endereco');
INSERT INTO auth_permission VALUES(34,9,'change_endereco','Can change endereco');
INSERT INTO auth_permission VALUES(35,9,'delete_endereco','Can delete endereco');
INSERT INTO auth_permission VALUES(36,9,'view_endereco','Can view endereco');
INSERT INTO auth_permission VALUES(37,10,'add_empresa','Can add empresa');
INSERT INTO auth_permission VALUES(38,10,'change_empresa','Can change empresa');
INSERT INTO auth_permission VALUES(39,10,'delete_empresa','Can delete empresa');
INSERT INTO auth_permission VALUES(40,10,'view_empresa','Can view empresa');
INSERT INTO auth_permission VALUES(41,11,'add_iso','Can add iso');
INSERT INTO auth_permission VALUES(42,11,'change_iso','Can change iso');
INSERT INTO auth_permission VALUES(43,11,'delete_iso','Can delete iso');
INSERT INTO auth_permission VALUES(44,11,'view_iso','Can view iso');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$720000$RXnWacZaMp40jSxVUqSQrG$/RbNhK2C5xo54ugYJusDYGvJZOeA7xFXsJdmuoxIOro=','2024-06-16 20:02:34.680487',1,'admin','','admin@admin.com',1,1,'2024-06-07 20:32:27.929217','');
INSERT INTO auth_user VALUES(2,'pbkdf2_sha256$720000$ot8IaIPJgi8YVTugW8G74t$GSevhjURtT8tCxpL5A03dPilwpfNdxcbxtj/s7NYIS4=','2024-06-17 10:23:36.155645',1,'pbe','','pbe@admin.com',1,1,'2024-06-17 10:23:05.817002','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('70olfrmukxyyzncq9w9kgqpaezvv8h5e','.eJxVjEEOwiAUBe_C2hAoUMCl-56BPOBXqoYmpV0Z726bdKHbNzPvzQK2tYSt0RKmzK5MssvvFpGeVA-QH6j3mae5rssU-aHwkzY-zJlet9P9OyhoZa-dJShPMjrnCXZUHagXSVqXpYfSpocwSsPs2FPnRi00IYlkhUM0mX2-4CA33Q:1sFgGY:4YuKthpSFUpawOXZ6884FYFrk4Mj9m0HCgufl0T33Q8','2024-06-21 20:32:50.354272');
INSERT INTO django_session VALUES('7f633br15la6az634og343tntrozywot','.eJxVjEEOwiAUBe_C2hAoUMCl-56BPOBXqoYmpV0Z726bdKHbNzPvzQK2tYSt0RKmzK5MssvvFpGeVA-QH6j3mae5rssU-aHwkzY-zJlet9P9OyhoZa-dJShPMjrnCXZUHagXSVqXpYfSpocwSsPs2FPnRi00IYlkhUM0mX2-4CA33Q:1sGJuX:H_8Rkn5TPeYvmXTo1RPCT3xnYyMLCh3KcdyKV7OXRlg','2024-06-23 14:52:45.824418');
INSERT INTO django_session VALUES('u1s1q4arqvb83hp8gbmbiyu35x6ydy09','.eJxVjEEOwiAUBe_C2hAoUMCl-56BPOBXqoYmpV0Z726bdKHbNzPvzQK2tYSt0RKmzK5MssvvFpGeVA-QH6j3mae5rssU-aHwkzY-zJlet9P9OyhoZa-dJShPMjrnCXZUHagXSVqXpYfSpocwSsPs2FPnRi00IYlkhUM0mX2-4CA33Q:1sGip6:n1GueV1lvTf3TzN4HD9OiMTQEpDzuhXorz5DLAyn1rE','2024-06-24 17:28:48.246619');
INSERT INTO django_session VALUES('qfx4qk6cors3nqjml4tr07pxfx5mjk21','.eJxVjEEOwiAUBe_C2hAoUMCl-56BPOBXqoYmpV0Z726bdKHbNzPvzQK2tYSt0RKmzK5MssvvFpGeVA-QH6j3mae5rssU-aHwkzY-zJlet9P9OyhoZa-dJShPMjrnCXZUHagXSVqXpYfSpocwSsPs2FPnRi00IYlkhUM0mX2-4CA33Q:1sIw5C:f80tdYwlCV9HF5aDS0Y0pwWfWtn1H51QET0YrryPuPI','2024-06-30 20:02:34.688488');
INSERT INTO django_session VALUES('exnp61d24n0xjsj6z66sezjal0rcihjb','.eJxVjMsOwiAURP-FtSGFy9Ol-34DubykaiAp7cr475akC91N5pyZN3G4b8XtPa1uieRKOLn8dh7DM9UB4gPrvdHQ6rYung6FnrTTucX0up3u30HBXsbaZKYFE0mCsIxbozVKlT1P4FEECwGyVRmkNmoycCAzaWa8VfZIQpHPF70uNoU:1sJ9WS:nKsmIAfK1ETJ4KQBfx_k62vaesNDQAYvvgEENIYp5H0','2024-07-01 10:23:36.166473');
CREATE TABLE IF NOT EXISTS "mapa_empresa" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nome_empresa" varchar(255) NOT NULL, "nome" varchar(255) NOT NULL, "email" varchar(254) NOT NULL, "telefone" varchar(20) NOT NULL, "cnpj" varchar(20) NOT NULL);
INSERT INTO mapa_empresa VALUES(33,'teste1','teste1','teste1@teste.com','21 99999999','12345678912');
INSERT INTO mapa_empresa VALUES(34,'teste2','teste2','teste2@teste.com','21 99996332','12345678912');
INSERT INTO mapa_empresa VALUES(35,'teste3','teste3','teste3@teste.com','21 9999994','12345678912');
INSERT INTO mapa_empresa VALUES(36,'teste','teste','teste@teste.cmo','111','111');
INSERT INTO mapa_empresa VALUES(37,'teste4','teste4','teste@teste.com','21 99996332','12345678912');
CREATE TABLE IF NOT EXISTS "mapa_endereco" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "bairro" varchar(255) NOT NULL, "cidade" varchar(255) NOT NULL, "latitude" varchar(20) NOT NULL, "longitude" varchar(20) NOT NULL, "numero" varchar(10) NULL, "cep" varchar(10) NOT NULL, "logradouro" varchar(255) NOT NULL, "complemento" varchar(255) NULL, "uf" varchar(2) NOT NULL, "empresa_id" bigint NOT NULL REFERENCES "mapa_empresa" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO mapa_endereco VALUES(21,'Alto da Boa Vista','Rio de Janeiro','-22.9519','-43.2105',NULL,'20531-590','Parque Nacional da Tijuca',NULL,'RJ',33);
INSERT INTO mapa_endereco VALUES(22,'Copacabana','Rio de Janeiro','-22.9711','-43.1822',NULL,'22010-000','Avenida Atlântica',NULL,'RJ',33);
INSERT INTO mapa_endereco VALUES(23,'Maracanã','Rio de Janeiro','-22.9121','-43.2302',NULL,'20271150','Rua Professor Eurico Rabelo',NULL,'RJ',33);
INSERT INTO mapa_endereco VALUES(24,'Centro','Rio de Janeiro','-22.8959','-43.1809',NULL,'20081-240','Praça Mauá',NULL,'RJ',34);
INSERT INTO mapa_endereco VALUES(25,'Urca','Rio de Janeiro','-22.9485','-43.1565',NULL,'57400-000','Avenida Pasteur',NULL,'RJ',34);
INSERT INTO mapa_endereco VALUES(26,'Ipanema','Rio de Janeiro','-22.9836','-43.2056',NULL,'22420-002','Avenida Vieira Souto',NULL,'RJ',35);
INSERT INTO mapa_endereco VALUES(27,'Centro','Cabo Frio','-22.8894','-42.0243',NULL,'48287000','Praia do Forte',NULL,'RJ',35);
INSERT INTO mapa_endereco VALUES(28,'Centro','Paraty','-23.2221','-44.7179',NULL,'23970-000','Centro Histórico',NULL,'RJ',36);
INSERT INTO mapa_endereco VALUES(29,'Centro','Petrópolis','-22.5083','-43.1779',NULL,'25610-320','Rua da Imperatriz',NULL,'RJ',36);
INSERT INTO mapa_endereco VALUES(30,'Centro','São Paulo','-23.5617','-46.6554',NULL,'28949-794','Avenida Paulista',NULL,'SP',37);
INSERT INTO mapa_endereco VALUES(31,'Centro','Salvador','-12.9714','-38.5070',NULL,'40026280','Centro Histórico de Salvador',NULL,'BA',37);
INSERT INTO mapa_endereco VALUES(32,'Centro','Ouro Preto','-20.3853','-43.5037',NULL,'35417-000','Praça Tiradentes',NULL,'MG',37);
INSERT INTO mapa_endereco VALUES(33,'Esplanada dos Ministérios','Brasília','-15.7998','-47.8645',NULL,'70059-900','Esplanada dos Ministérios',NULL,'DF',37);
INSERT INTO mapa_endereco VALUES(34,'Centro','Fortaleza','-3.7318616','-38.5266704',NULL,'60822-975','Rua Pedro I',NULL,'CE',37);
CREATE TABLE IF NOT EXISTS "mapa_iso" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "iso_type" varchar(50) NOT NULL, "odc" varchar(50) NOT NULL, "consultor" varchar(255) NOT NULL, "data_efetivacao" date NOT NULL, "validade" date NOT NULL, "empresa_id" bigint NOT NULL REFERENCES "mapa_empresa" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO mapa_iso VALUES(14,'9001','teste','teste','2024-06-17','2027-06-17',33);
INSERT INTO mapa_iso VALUES(15,'9001','teste2','teste2','2024-06-17','2027-06-17',34);
INSERT INTO mapa_iso VALUES(16,'9001','teste3','teste3','2024-06-17','2027-06-17',35);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',20);
INSERT INTO sqlite_sequence VALUES('django_admin_log',9);
INSERT INTO sqlite_sequence VALUES('django_content_type',11);
INSERT INTO sqlite_sequence VALUES('auth_permission',44);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',2);
INSERT INTO sqlite_sequence VALUES('mapa_endereco',34);
INSERT INTO sqlite_sequence VALUES('mapa_empresa',37);
INSERT INTO sqlite_sequence VALUES('mapa_iso',16);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "mapa_endereco_empresa_id_b7c9dd5b" ON "mapa_endereco" ("empresa_id");
CREATE INDEX "mapa_iso_empresa_id_db2804a2" ON "mapa_iso" ("empresa_id");
COMMIT;