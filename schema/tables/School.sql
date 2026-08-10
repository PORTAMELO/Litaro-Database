CREATE TABLE School (
    SchoolId        INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(150)           NOT NULL,
    Nit             VARCHAR(20)             NOT NULL,
    Address         NVARCHAR(200)           NOT NULL,
    Phone           VARCHAR(20)             NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFSchoolActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFSchoolCreationDate DEFAULT SYSDATETIME(),
    CONSTRAINT      PK_School               PRIMARY KEY (SchoolId),
    CONSTRAINT      UQSchoolNit             UNIQUE (Nit)
);
GO


