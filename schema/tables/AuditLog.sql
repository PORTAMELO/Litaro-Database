CREATE TABLE AuditLog (

    AuditId         BIGINT                  IDENTITY(1,1) PRIMARY KEY,
    TableName       VARCHAR(100)            NOT NULL,
    RecordId        VARCHAR(100)            NOT NULL,
    ActionType      CHAR(1)                 NOT NULL,
    OldValues       NVARCHAR(MAX)           NULL,
    NewValues       NVARCHAR(MAX)           NULL,
    ChangedBy       INT                     NULL,
    ChangedDate     DATETIME2               NOT NULL DEFAULT SYSDATETIME()
);

GO