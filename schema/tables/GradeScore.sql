CREATE TABLE GradeScore (
    GradeScoreId    INT                     NOT NULL IDENTITY(1,1),
    EnrollmentId    INT                     NOT NULL,
    SubjectId       INT                     NOT NULL,
    PeriodId        SMALLINT                NOT NULL,
    Value           DECIMAL(4,2)            NOT NULL,
    Description     NVARCHAR(300)           NULL,
    RecordedDate    DATETIME2               NOT NULL CONSTRAINT DFGradeScoreRecordedDate DEFAULT SYSDATETIME(),
    CONSTRAINT      PKGradeScore            PRIMARY KEY (GradeScoreId),
    CONSTRAINT      FKGradeScoreEnrollment  FOREIGN KEY (EnrollmentId) REFERENCES Enrollment(EnrollmentId),
    CONSTRAINT      FKGradeScoreSubject     FOREIGN KEY (SubjectId)    REFERENCES Subject(SubjectId),
    CONSTRAINT      FKGradeScorePeriod      FOREIGN KEY (PeriodId)     REFERENCES AcademicPeriod(PeriodId),
    CONSTRAINT      UQGradeScoreEnrollment  UNIQUE (EnrollmentId, SubjectId, PeriodId),
    CONSTRAINT      CKGradeScoreValue       CHECK (value BETWEEN 0.00 AND 5.00)
);
GO