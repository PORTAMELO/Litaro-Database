CREATE TABLE WebContent (
    WebContentId              INT           NOT NULL IDENTITY(1,1),
    PageName                  VARCHAR(50)   NOT NULL,
    SectionName               VARCHAR(50)   NOT NULL,
    ContentKey                VARCHAR(50)   NOT NULL,
    DisplayOrder              INT           NOT NULL CONSTRAINT DF_WebContent_DisplayOrder DEFAULT 0,
    DataJson                  NVARCHAR(MAX) NOT NULL,
    Active                    BIT           NOT NULL CONSTRAINT DF_WebContent_Active DEFAULT 1,
    CreationDate              DATETIME2     NOT NULL CONSTRAINT DF_WebContent_CreationDate DEFAULT SYSDATETIME(),
    UpdateDate                DATETIME2     NULL,
    CONSTRAINT PK_WebContent                PRIMARY KEY (WebContentId),
    CONSTRAINT CK_WebContent_DataJson       CHECK (ISJSON(DataJson) = 1),
    CONSTRAINT FK_WebContent_WebContentConfiguration    FOREIGN KEY (PageName, SectionName, ContentKey) REFERENCES WebContentConfiguration(PageName, SectionName, ContentKey)
);
GO