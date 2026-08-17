CREATE TABLE AcademicPeriod (
    PeriodId        SMALLINT                NOT NULL IDENTITY(1,1),
    Periodnumber    TINYINT                 NOT NULL,
    StartDate       DATETIME2               NOT NULL,
    EndDate         DATETIME2               NOT NULL,
    YearId          SMALLINT                NOT NULL,
    CONSTRAINT      PKAcademicPeriod        PRIMARY KEY (PeriodId),
    CONSTRAINT      FKAcademicPeriodYear    FOREIGN KEY (YearId) REFERENCES AcademicYear(YearId),
    CONSTRAINT      UQAcademicPeriodYear    UNIQUE (Periodnumber, YearId),
    CONSTRAINT      CKAcademicPeriodDates   CHECK (EndDate > StartDate),
    CONSTRAINT      CKAcademicPeriodNumber  CHECK (Periodnumber BETWEEN 1 AND 14)
);
GO