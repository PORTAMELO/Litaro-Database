CREATE TABLE Parent (
    ParentId        INT                     NOT NULL,
    Relationship    VARCHAR(20)             NOT NULL,
    CONSTRAINT      PKGuardian              PRIMARY KEY (ParentId),
    CONSTRAINT      FKGuardianUser          FOREIGN KEY (ParentId) REFERENCES [User](UserId),
    CONSTRAINT      CKGuardianRelationship  CHECK (relationship IN ('FATHER', 'MOTHER', 'GRANDFATHER', 'GRANDMOTHER', 'UNCLE', 'AUNT', 'BROTHER', 'SISTER', 'OTHER'))
);
GO