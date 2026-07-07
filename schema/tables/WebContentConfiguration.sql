CREATE TABLE WebContentConfiguration (
    WebContentConfigurationId INT           NOT NULL IDENTITY(1,1),
    PageName                  VARCHAR(50)   NOT NULL,
    SectionName               VARCHAR(50)   NOT NULL,
    ContentKey                VARCHAR(50)   NOT NULL,
    MinItems                  INT           NOT NULL CONSTRAINT DFWebContentConfigMinItems DEFAULT 0,
    MaxItems                  INT           NULL,
    TemplateJson              NVARCHAR(MAX) NOT NULL,
    Active                    BIT           NOT NULL CONSTRAINT DFWebContentConfigActive DEFAULT 1,
    CreationDate              DATETIME2     NOT NULL CONSTRAINT DFWebContentConfigCreationDate DEFAULT SYSDATETIME(),
    CONSTRAINT  PK_WebContentConfiguration  PRIMARY KEY (WebContentConfigurationId),
    CONSTRAINT UQ_WebContentConfiguration   UNIQUE (PageName, SectionName, ContentKey),
    CONSTRAINT CK_WebContentConfiguration_MinItems  CHECK (MinItems >= 0),
    CONSTRAINT CK_WebContentConfiguration_MaxItems  CHECK (MaxItems IS NULL OR MaxItems > 0),
    CONSTRAINT CK_WebContentConfiguration_MinMax    CHECK (MaxItems IS NULL OR MaxItems >= MinItems),
    CONSTRAINT CK_WebContentConfiguration_TemplateJson  CHECK (ISJSON(TemplateJson) = 1)
);
GO