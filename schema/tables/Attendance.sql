CREATE TABLE Attendance (
    AttendanceId    INT                     NOT NULL IDENTITY(1,1),
    EnrollmentId    INT                     NOT NULL,
    SubjectId       INT                     NOT NULL,
    Date            DATETIME2               NOT NULL,
    Status          VARCHAR(8)              NOT NULL,
    Observation     NVARCHAR(200)           NULL,
    CONSTRAINT      PKAttendance            PRIMARY KEY (AttendanceId),
    CONSTRAINT      FKAttendanceEnrollment  FOREIGN KEY (EnrollmentId) REFERENCES Enrollment(EnrollmentId),
    CONSTRAINT      FKAttendanceSubject     FOREIGN KEY (SubjectId)    REFERENCES Subject(SubjectId),
    CONSTRAINT      UQAttendanceEnrollment  UNIQUE (EnrollmentId, SubjectId, Date),
    CONSTRAINT      CKAttendanceStatus      CHECK (status IN ('PRESENT', 'ABSENT', 'LATE'))
);
GO

CREATE INDEX IXAttendanceDate             ON Attendance(Date);
GO