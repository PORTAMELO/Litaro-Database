CREATE TABLE StudentLog (
    LogId           INT                     NOT NULL IDENTITY(1,1),
    EnrollmentId    INT                     NOT NULL,
    Date            Date                    NOT NULL CONSTRAINT DFStudentLogDate DEFAULT CAST(GETDate() AS Date),
    Type            VARCHAR(15)             NOT NULL,
    Observation     NVARCHAR(1000)          NOT NULL,
    UserRecordedId  INT                     NOT NULL,
    CONSTRAINT      PKStudentLog            PRIMARY KEY (LogId),
    CONSTRAINT      FKStudentLogEnrollment  FOREIGN KEY (EnrollmentId)    REFERENCES Enrollment(EnrollmentId),
    CONSTRAINT      FKStudentLogUser        FOREIGN KEY (UserRecordedId) REFERENCES [User](UserId),
    CONSTRAINT      CKStudentLogType        CHECK (Type IN ('DISCIPLINARY', 'ACADEMIC', 'COEXISTENCE', 'ACHIEVEMENT'))
);
GO

CREATE INDEX IXStudentLogEnrollment       ON StudentLog(EnrollmentId);
GO