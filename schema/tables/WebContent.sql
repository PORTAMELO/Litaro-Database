CREATE TABLE WebContent (
    WebContentId    INT                     NOT NULL IDENTITY(1,1),
    PageName        VARCHAR(50)             NOT NULL,
    SectionName     VARCHAR(50)             NOT NULL,
    ContentKey      VARCHAR(50)             NOT NULL,
    DisplayOrder    INT                     NOT NULL CONSTRAINT DFWebContentDisplayOrder DEFAULT 0,
    DataJson        NVARCHAR(MAX)           NOT NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFWebContentActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFWebContentCreationDate DEFAULT SYSDATETIME(),
    UpdateDate      DATETIME2               NULL,
    CONSTRAINT      PKWebContent            PRIMARY KEY (WebContentId),
    CONSTRAINT      CKWebContentJson        CHECK (ISJSON(DataJson) = 1),
    CONSTRAINT      FKWebContentConfiguration   FOREIGN KEY (PageName, SectionName, ContentKey)     REFERENCES WebContentConfiguration(PageName, SectionName, ContentKey)
);
GO

CREATE INDEX IXWebContentPageSection        ON WebContent(PageName, SectionName);
GO

CREATE INDEX IXWebContentDisplayOrder       ON WebContent(PageName, SectionName, DisplayOrder);
GO