CREATE TABLE [User] (
    UserId          INT                     NOT NULL IDENTITY(1,1),
    DocumentType    VARCHAR(5)              NOT NULL,
    DocumentNumber  VARCHAR(20)             NOT NULL,
    FirstName       NVARCHAR(100)           NOT NULL,
    LastName        NVARCHAR(100)           NOT NULL,
    Email           VARCHAR(150)            NOT NULL,
    PasswordHash    VARCHAR(256)            NOT NULL,
    Role            VARCHAR(15)             NOT NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFUserActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFUserCreatedDate DEFAULT SYSDATETIME(),
    CampusId        INT                     NOT NULL,
    CONSTRAINT      PKUser                  PRIMARY KEY (UserId),
    CONSTRAINT      FKUserCampus            FOREIGN KEY (CampusId) REFERENCES Campus(CampusId),
    CONSTRAINT      UQUserDocument          UNIQUE (DocumentType, DocumentNumber),
    CONSTRAINT      UQUserEmail             UNIQUE (Email),
    CONSTRAINT      CKUserDocumentType      CHECK (DocumentType IN ('CC', 'TI', 'CE', 'PAS', 'RC')),
    CONSTRAINT      CKUserRole              CHECK (Role IN ('ADMIN', 'TEACHER', 'STUDENT', 'PARENT'))
);
GO

CREATE INDEX IXUserDocument                 ON [User](DocumentNumber);
GO