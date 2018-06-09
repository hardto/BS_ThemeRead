SET SQL_SAFE_UPDATES = 0;

drop table if exists t_article_comment;

drop table if exists t_article_resource;

drop table if exists t_auth;

drop table if exists t_colltype;

drop table if exists t_login;

drop table if exists t_recommend;

drop table if exists t_role;

drop table if exists t_role_auth;

drop table if exists t_type;

drop table if exists t_user;

drop table if exists t_user_action;

drop table if exists t_user_article;

drop table if exists t_user_auths;

drop table if exists t_user_role;

/*==============================================================*/
/* Table: t_article_comment                                     */
/*==============================================================*/
create table t_article_comment
(
   id                   varchar(16) not null,
   article_id           varchar(32),
   comment              varchar(64),
   user_id              varchar(16),
   parent_id            varchar(16),
   col1                 varchar(32),
   col2                 varchar(16),
   primary key (id)
);

/*==============================================================*/
/* Table: t_article_resource                                    */
/*==============================================================*/
create table t_article_resource
(
   id                   varchar(16) not null,
   article_id           varchar(32),
   image                varchar(128),
   primary key (id)
);

alter table t_article_resource comment '存储文章相关资源';

/*==============================================================*/
/* Table: t_auth                                                */
/*==============================================================*/
create table t_auth
(
   id                   varchar(2) not null,
   auth_name            varchar(16),
   col                  varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: t_colltype                                            */
/*==============================================================*/
create table t_colltype
(
   id                   varchar(64) not null,
   user_id              varchar(128),
   type_id              varchar(64),
   col                  varchar(64) binary,
   col2                 varchar(128),
   create_time          date,
   primary key (id)
);

/*==============================================================*/
/* Table: t_login                                               */
/*==============================================================*/
create table t_login
(
   id                   varchar(16) not null,
   user_id              varchar(16),
   login_time           date,
   login_ip             varchar(16),
   col1                 varchar(32),
   primary key (id)
);

alter table t_login comment '为账号异地登陆提供前期的安全机制';

/*==============================================================*/
/* Table: t_recommend                                           */
/*==============================================================*/
create table t_recommend
(
   id                   varchar(32) not null,
   type_id              varchar(2),
   user_id              varchar(16),
   article_id           varchar(32),
   content              varchar(1024),
   "add"                varchar(512),
   col                  varchar(64),
   col2                 varchar(128),
   create_time          date,
   primary key (id)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   varchar(2) not null,
   role_name            varchar(16),
   col1                 varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: t_role_auth                                           */
/*==============================================================*/
create table t_role_auth
(
   role_id              varchar(2) not null,
   auth_id              varchar(2) not null,
   col1                 varchar(32),
   primary key (role_id, auth_id)
);

alter table t_role_auth comment '角色权限关联表';

/*==============================================================*/
/* Table: t_type                                                */
/*==============================================================*/
create table t_type
(
   id                   varchar(2) not null,
   parent_id            varchar(2),
   name                 varchar(16),
   col                  varchar(64),
   hot                  int,
   primary key (id)
);

alter table t_type comment '阅读文章类别表';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   varchar(16) not null,
   account              varchar(8),
   password             varchar(16),
   real_name            varchar(8),
   age                  int,
   sex                  char(1),
   introduce            varchar(256),
   address              varchar(128),
   phone                char(11),
   email                varchar(64),
   level                int,
   register_time        date,
   register_ip          varchar(16),
   status               char(1),
   role                 varchar(8),
   avatar               varchar(32),
   col1                 varchar(64),
   col2                 varchar(128),
   primary key (id)
);

alter table t_user comment '本地用户信息表';

/*==============================================================*/
/* Table: t_user_action                                         */
/*==============================================================*/
create table t_user_action
(
   id                   varchar(256) not null,
   user_id              varchar(16),
   type_id              varchar(2),
   click_num            varchar(16),
   col1                 varchar(16),
   col2                 varchar(32),
   primary key (id)
);

alter table t_user_action comment '分析用户点击行为';

/*==============================================================*/
/* Table: t_user_article                                        */
/*==============================================================*/
create table t_user_article
(
   id                   varchar(32) not null,
   user_id              varchar(16),
   title                varchar(64),
   introduce            varchar(128),
   content              varchar(512),
   author               varchar(8),
   release_time         date,
   collect_time         date,
   resource             varchar(256),
   type_id              varchar(2),
   col1                 varchar(16),
   col2                 varchar(32),
   primary key (id)
);

alter table t_user_article comment '用户所喜爱的文章';

/*==============================================================*/
/* Table: t_user_auths                                          */
/*==============================================================*/
create table t_user_auths
(
   id                   varchar(16) not null,
   user_id              varchar(16),
   identity_type        varchar(8),
   identity             varchar(32),
   credential           varchar(128),
   col1                 varchar(32),
   col2                 varchar(64),
   primary key (id)
);

alter table t_user_auths comment '第三方或手机邮箱等登陆方式';

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   role_id              varchar(2) not null,
   user_id              varchar(16) not null,
   col1                 varchar(32),
   primary key (role_id, user_id)
);

alter table t_user_role comment '多对多';

alter table t_article_comment add constraint FK_Reference_11 foreign key (article_id)
      references t_user_article (id) on delete restrict on update restrict;

alter table t_article_comment add constraint FK_Reference_12 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_article_resource add constraint FK_Reference_10 foreign key (article_id)
      references t_user_article (id) on delete restrict on update restrict;

alter table t_colltype add constraint FK_Reference_16 foreign key (type_id)
      references t_type (id) on delete restrict on update restrict;

alter table t_colltype add constraint FK_Reference_17 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_login add constraint FK_Reference_1 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_recommend add constraint FK_Reference_13 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_recommend add constraint FK_Reference_14 foreign key (type_id)
      references t_type (id) on delete restrict on update restrict;

alter table t_recommend add constraint FK_Reference_15 foreign key (article_id)
      references t_user_article (id) on delete restrict on update restrict;

alter table t_role_auth add constraint FK_Reference_5 foreign key (role_id)
      references t_role (id) on delete restrict on update restrict;

alter table t_role_auth add constraint FK_Reference_6 foreign key (auth_id)
      references t_auth (id) on delete restrict on update restrict;

alter table t_user_action add constraint FK_Reference_8 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_user_action add constraint FK_Reference_9 foreign key (type_id)
      references t_type (id) on delete restrict on update restrict;

alter table t_user_article add constraint FK_Reference_7 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_user_auths add constraint FK_Reference_2 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_user_role add constraint FK_Reference_3 foreign key (user_id)
      references t_user (id) on delete restrict on update restrict;

alter table t_user_role add constraint FK_Reference_4 foreign key (role_id)
      references t_role (id) on delete restrict on update restrict;
