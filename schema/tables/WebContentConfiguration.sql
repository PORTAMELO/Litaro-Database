CREATE TABLE WebContentConfiguration (
    WebContentConfigurationId INT           NOT NULL IDENTITY(1,1),
    PageName        VARCHAR(50)             NOT NULL,
    SectionName     VARCHAR(50)             NOT NULL,
    ContentKey      VARCHAR(50)             NOT NULL,
    MinItems        INT                     NOT NULL CONSTRAINT DFWebContentConfigMinItems DEFAULT 0,
    MaxItems        INT                     NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFWebContentConfigActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFWebContentConfigCreationDate DEFAULT SYSDATETIME(),
    CONSTRAINT      PKWebContentConfiguration   PRIMARY KEY (WebContentConfigurationId),
    CONSTRAINT      UQWebContentConfiguration   UNIQUE (PageName, SectionName, ContentKey),
    CONSTRAINT      CKWebContentConfigMinItems  CHECK (MinItems >= 0),
    CONSTRAINT      CKWebContentConfigMaxItems  CHECK (MaxItems IS NULL OR MaxItems > 0),
    CONSTRAINT      CKWebContentConfigMinMax    CHECK (MaxItems IS NULL OR MaxItems >= MinItems)
);
GO