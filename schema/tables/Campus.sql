CREATE TABLE Campus (
    CampusId        INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(150)           NOT NULL,
    Address         NVARCHAR(200)           NOT NULL,
    Phone           VARCHAR(20)             NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFCampusActive DEFAULT 1,
    SchoolId        INT                     NOT NULL,
    CONSTRAINT      PKCampus                PRIMARY KEY (CampusId),
    CONSTRAINT      FKCampusSchool          FOREIGN KEY (SchoolId) REFERENCES School(SchoolId),
);
GO