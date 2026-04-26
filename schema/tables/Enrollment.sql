CREATE TABLE Enrollment (
    EnrollmentId    INT                     NOT NULL IDENTITY(1,1),
    StudentId       INT                     NOT NULL,
    ClassroomId     INT                     NOT NULL,
    YearId          SMALLINT                NOT NULL,
    Status          VARCHAR(12)             NOT NULL CONSTRAINT DFEnrollmentStatus DEFAULT 'ACTIVE',
    EnrollmentDate  DATETIME2               NOT NULL CONSTRAINT DFEnrollmentDate DEFAULT CAST(GETDATE() AS DATE),
    CONSTRAINT      PKEnrollment            PRIMARY KEY (EnrollmentId),
    CONSTRAINT      FKEnrollmentStudent     FOREIGN KEY (StudentId)   REFERENCES Student(StudentId),
    CONSTRAINT      FKEnrollmentClassroom   FOREIGN KEY (ClassroomId) REFERENCES Classroom(ClassroomId),
    CONSTRAINT      FKEnrollmentYear        FOREIGN KEY (YearId)      REFERENCES AcademicYear(YearId),
    CONSTRAINT      UQEnrollmentStudent     UNIQUE (StudentId, YearId),
    CONSTRAINT      CKEnrollmentStatus      CHECK (status IN ('ACTIVE', 'PROMOTED', 'HELDBACK', 'WITHDRAWN'))
);
GO

CREATE INDEX IXEnrollmentStudent            ON Enrollment(StudentId);
CREATE INDEX IXEnrollmentClassroomYear      ON Enrollment(ClassroomId, YearId);
GO