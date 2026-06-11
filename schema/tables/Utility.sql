CREATE TABLE Utility (
    UtilityId       INT                     NOT NULL IDENTITY(1,1),
    Page            VARCHAR(50)             NOT NULL,
    SubPage         VARCHAR(50)             NULL,
    Section         VARCHAR(100)            NOT NULL,
    ContentKey      VARCHAR(100)            NOT NULL,
    DataArray       NVARCHAR(MAX)           NOT NULL,
    CONSTRAINT      PKUtility               PRIMARY KEY (UtilityId),
    CONSTRAINT      UQUtilityLocation
                    UNIQUE (Page, SubPage, Section, ContentKey)
);
GO
