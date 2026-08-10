CREATE TABLE AcademicYear (
    YearId          SMALLINT                NOT NULL,
    StartDate       DATETIME2               NOT NULL,
    EndDate         DATETIME2               NOT NULL,
    Status          VARCHAR(10)             NOT NULL CONSTRAINT DF_AcademicYearStatus DEFAULT 'ACTIVE',
    CONSTRAINT      PKAcademicYear          PRIMARY KEY (YearId),
    CONSTRAINT      CKAcademicYearStatus    CHECK (Status IN ('ACTIVE', 'CLOSED')),
    CONSTRAINT      CKAcademicYearDates     CHECK (EndDate > StartDate),
    CONSTRAINT      CKAcademicYearRange     CHECK (YearId BETWEEN 1900 AND 2300)
);
GO