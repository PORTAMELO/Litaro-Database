CREATE TABLE Subject (
    SubjectId       INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(100)           NOT NULL,
    WeeklyHours     TINYINT                 NOT NULL,
    knowledgeArea   NVARCHAR(80)            NOT NULL,
    CONSTRAINT      PKSubject               PRIMARY KEY (SubjectId),
    CONSTRAINT      CKSubjectHours          CHECK (WeeklyHours BETWEEN 1 AND 10)
);
GO