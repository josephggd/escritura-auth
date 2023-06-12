CREATE TABLE escritura_user
(
    id         UUID NOT NULL,
    created    date,
    username   VARCHAR(255),
    password   VARCHAR(255),
    CONSTRAINT pk_escritura_user PRIMARY KEY (id)
);

CREATE TABLE escritura_user_roles
(
    escritura_user_id UUID NOT NULL,
    roles_id          UUID NOT NULL,
    CONSTRAINT pk_escritura_user_roles PRIMARY KEY (escritura_user_id, roles_id)
);

ALTER TABLE escritura_user_roles
    ADD CONSTRAINT fk_escuserol_on_escritura_user FOREIGN KEY (escritura_user_id) REFERENCES escritura_user (id);

CREATE TABLE user_role
(
    id      UUID NOT NULL,
    created date,
    role    INTEGER,
    CONSTRAINT pk_userrole PRIMARY KEY (id)
);

ALTER TABLE escritura_user_roles
    ADD CONSTRAINT fk_escuserol_on_user_role FOREIGN KEY (roles_id) REFERENCES user_role (id);

CREATE TABLE user_role_users
(
    user_role_id UUID NOT NULL,
    users_id     UUID NOT NULL,
    CONSTRAINT pk_userrole_users PRIMARY KEY (user_role_id, users_id)
);

ALTER TABLE user_role_users
    ADD CONSTRAINT fk_useroluse_on_escritura_user FOREIGN KEY (users_id) REFERENCES escritura_user (id);

ALTER TABLE user_role_users
    ADD CONSTRAINT fk_useroluse_on_user_role FOREIGN KEY (user_role_id) REFERENCES user_role (id);

CREATE TABLE refresh_token
(
    id                    UUID NOT NULL,
    expiration_plus_hours BIGINT,
    expiration            TIMESTAMP WITHOUT TIME ZONE,
    code                  UUID,
    created               date,
    user_id               UUID,
    CONSTRAINT pk_refreshtoken PRIMARY KEY (id)
);

ALTER TABLE refresh_token
    ADD CONSTRAINT FK_REFRESHTOKEN_ON_USER FOREIGN KEY (user_id) REFERENCES escritura_user (id);

CREATE TABLE confirmation_token
(
    id                    UUID NOT NULL,
    expiration_plus_hours BIGINT,
    expiration            TIMESTAMP WITHOUT TIME ZONE,
    code                  UUID,
    created               date,
    user_id               UUID,
    CONSTRAINT pk_confirmationtoken PRIMARY KEY (id)
);

ALTER TABLE confirmation_token
    ADD CONSTRAINT FK_CONFIRMATIONTOKEN_ON_USER FOREIGN KEY (user_id) REFERENCES escritura_user (id);

CREATE TABLE access_token
(
    id                    UUID NOT NULL,
    expiration_plus_hours BIGINT,
    expiration            TIMESTAMP WITHOUT TIME ZONE,
    code                  UUID,
    created               date,
    user_id               UUID,
    CONSTRAINT pk_accesstoken PRIMARY KEY (id)
);

ALTER TABLE access_token
    ADD CONSTRAINT FK_ACCESSTOKEN_ON_USER FOREIGN KEY (user_id) REFERENCES escritura_user (id);
