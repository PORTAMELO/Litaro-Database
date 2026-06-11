IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Litaro')
BEGIN
    CREATE DATABASE Litaro;
END
GO

USE Litaro;
GO

-- ============================================================
-- 1. ENTIDADES INSTITUCIONALES
-- ============================================================

CREATE TABLE School (
    SchoolId        INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(150)           NOT NULL,
    Nit             VARCHAR(20)             NOT NULL,
    Address         NVARCHAR(200)           NOT NULL,
    Phone           VARCHAR(20)             NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFSchoolActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFSchoolCreationDate DEFAULT SYSDATETIME(),
    CONSTRAINT      PK_School               PRIMARY KEY (SchoolId),
    CONSTRAINT      UQSchoolNit             UNIQUE (Nit)
);
GO

CREATE TABLE Campus (
    CampusId        INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(150)           NOT NULL,
    Address         NVARCHAR(200)           NOT NULL,
    Phone           VARCHAR(20)             NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFCampusActive DEFAULT 1,
    SchoolId        INT                     NOT NULL,
    CONSTRAINT      PKCampus                PRIMARY KEY (CampusId),
    CONSTRAINT      FKCampusSchool          FOREIGN KEY (SchoolId) REFERENCES School(SchoolId),
);
GO

-- ============================================================
-- 2. GESTIÓN TEMPORAL
-- ============================================================

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

-- ============================================================
-- 3. USUARIOS Y ROLES
-- ============================================================

CREATE TABLE [User] (
    UserId          INT                     NOT NULL IDENTITY(1,1),
    DocumentType    VARCHAR(5)              NOT NULL,
    DocumentNumber  VARCHAR(20)             NOT NULL,
    FirstName       NVARCHAR(100)           NOT NULL,
    LastName        NVARCHAR(100)           NOT NULL,
    Email           VARCHAR(150)            NOT NULL,
    PasswordHash    VARCHAR(256)            NOT NULL,
    Role            VARCHAR(15)             NOT NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFUserActive DEFAULT 1,
    CreationDate    DATETIME2               NOT NULL CONSTRAINT DFUserCreatedDate DEFAULT SYSDATETIME(),
    CampusId        INT                     NOT NULL,
    CONSTRAINT      PKUser                  PRIMARY KEY (UserId),
    CONSTRAINT      FKUserCampus            FOREIGN KEY (CampusId) REFERENCES Campus(CampusId),
    CONSTRAINT      UQUserDocument          UNIQUE (DocumentType, DocumentNumber),
    CONSTRAINT      UQUserEmail             UNIQUE (Email),
    CONSTRAINT      CKUserDocumentType      CHECK (DocumentType IN ('CC', 'TI', 'CE', 'PAS', 'RC')),
    CONSTRAINT      CKUserRole              CHECK (Role IN ('ADMIN', 'TEACHER', 'STUDENT', 'PARENT'))
);
GO

CREATE INDEX IXUserDocument                 ON [User](DocumentNumber);
GO

CREATE TABLE Student (
    StudentId       INT                     NOT NULL,
    StudentCode     VARCHAR(20)             NOT NULL,
    BirthDate       DATETIME2               NOT NULL,
    Gender          CHAR(1)                 NOT NULL,
    CONSTRAINT      PKStudent               PRIMARY KEY (StudentId),
    CONSTRAINT      FKStudentUser           FOREIGN KEY (StudentId) REFERENCES [User](UserId),
    CONSTRAINT      UQStudentCode           UNIQUE (StudentCode),
    CONSTRAINT      CKStudentGender         CHECK (Gender IN ('M', 'F', 'O')),
    CONSTRAINT      CKStudentBirthDate      CHECK (BirthDate <= CAST(GETDATE() AS DATE))
);
GO

CREATE TABLE Teacher (
    TeacherId       INT                     NOT NULL,
    Specialty       NVARCHAR(100)           NOT NULL,
    CONSTRAINT      PKTeacher               PRIMARY KEY (TeacherId),
    CONSTRAINT      FKTeacherUser           FOREIGN KEY (TeacherId) REFERENCES [User](UserId)
);
GO

CREATE TABLE Parent (
    ParentId        INT                     NOT NULL,
    Relationship    VARCHAR(20)             NOT NULL,
    CONSTRAINT      PKGuardian              PRIMARY KEY (ParentId),
    CONSTRAINT      FKGuardianUser          FOREIGN KEY (ParentId) REFERENCES [User](UserId),
    CONSTRAINT      CKGuardianRelationship  CHECK (relationship IN ('FATHER', 'MOTHER', 'GRANDFATHER', 'GRANDMOTHER', 'UNCLE', 'AUNT', 'BROTHER', 'SISTER', 'OTHER'))
);
GO

-- ============================================================
-- 4. RELACIÓN PADRE – ESTUDIANTE (N:M)
-- ============================================================

CREATE TABLE ParentStudent (
    ParentStudentId INT                     NOT NULL IDENTITY(1,1),
    ParentId        INT                     NOT NULL,
    StudentId       INT                     NOT NULL,
    PrimaryContact  BIT                     NOT NULL CONSTRAINT DFParentStudentContact DEFAULT 1,
    CONSTRAINT      PKParentStuden          PRIMARY KEY (ParentStudentId),
    CONSTRAINT      FKParentStuden          FOREIGN KEY (ParentId) REFERENCES Parent(ParentId),
    CONSTRAINT      FKStudenParent          FOREIGN KEY (StudentId)  REFERENCES Student(StudentId),
    CONSTRAINT      UQParentStudent         UNIQUE (ParentId, StudentId)
);
GO

-- ============================================================
-- 5. ESTRUCTURA ACADÉMICA
-- ============================================================

CREATE TABLE Grade (
    GradeId         INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(20)            NOT NULL,
    OrderNum        TINYINT                 NOT NULL,
    Level           VARCHAR(15)             NOT NULL,
    CONSTRAINT      PKGrade                 PRIMARY KEY (GradeId),
    CONSTRAINT      UQGradeOrder            UNIQUE (OrderNum),
    CONSTRAINT      CKGradeLevel            CHECK (Level IN ('ELEMENTARY', 'MIDDLE', 'HIGH')),
    CONSTRAINT      CKGradeOrder            CHECK (OrderNum BETWEEN 1 AND 20)
);
GO

CREATE TABLE Classroom (
    ClassroomId     INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(10)            NOT NULL,
    GradeId         INT                     NOT NULL,
    CampusId        INT                     NOT NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFClassroomActive DEFAULT 1,
    CONSTRAINT      PKClassroom             PRIMARY KEY (ClassroomId),
    CONSTRAINT      FKClassroomGrade        FOREIGN KEY (GradeId)  REFERENCES Grade(GradeId),
    CONSTRAINT      FKClassroomCampus       FOREIGN KEY (CampusId) REFERENCES Campus(CampusId)
);
GO

CREATE TABLE Subject (
    SubjectId       INT                     NOT NULL IDENTITY(1,1),
    Name            NVARCHAR(100)           NOT NULL,
    WeeklyHours     TINYINT                 NOT NULL,
    knowledgeArea   NVARCHAR(80)            NOT NULL,
    CONSTRAINT      PKSubject               PRIMARY KEY (SubjectId),
    CONSTRAINT      CKSubjectHours          CHECK (WeeklyHours BETWEEN 1 AND 10)
);
GO

-- ============================================================
-- 6. ASIGNACIÓN ACADÉMICA
-- ============================================================

CREATE TABLE AcademicAssignment (
    AssignmentId    INT                     NOT NULL IDENTITY(1,1),
    ClassroomId     INT                     NOT NULL,
    SubjectId       INT                     NOT NULL,
    TeacherId       INT                     NOT NULL,
    YearId          SMALLINT                NOT NULL,
    Active          BIT                     NOT NULL CONSTRAINT DFAcademicAssignmentActive DEFAULT 1,
    CONSTRAINT      PKAcademicAssignment    PRIMARY KEY (AssignmentId),
    CONSTRAINT      FKAcadAssignClassroom   FOREIGN KEY (ClassroomId) REFERENCES Classroom(ClassroomId),
    CONSTRAINT      FKAcadAssignSubject     FOREIGN KEY (SubjectId)   REFERENCES Subject(SubjectId),
    CONSTRAINT      FKAcadAssignTeacher     FOREIGN KEY (TeacherId)   REFERENCES Teacher(TeacherId),
    CONSTRAINT      FKAcadAssignYear        FOREIGN KEY (YearId)      REFERENCES AcademicYear(YearId),
    CONSTRAINT      UQAcadAssignClassroomSubjectYear UNIQUE (ClassroomId, SubjectId, YearId)
);
GO

CREATE TABLE Schedule (
    ScheduleId      INT                     NOT NULL IDENTITY(1,1),
    AssignmentId    INT                     NOT NULL,
    Weekday         TINYINT                 NOT NULL,
    StartTime       TIME                    NOT NULL,
    EndTime         TIME                    NOT NULL,
    CONSTRAINT      PKSchedule              PRIMARY KEY (ScheduleId),
    CONSTRAINT      FKScheduleAssignment    FOREIGN KEY (AssignmentId) REFERENCES AcademicAssignment(AssignmentId),
    CONSTRAINT      CKScheduleweekday       CHECK (weekday BETWEEN 1 AND 6),
    CONSTRAINT      CKScheduletimes         CHECK (EndTime > StartTime),
    CONSTRAINT      UQScheduleAssignment    UNIQUE (AssignmentId, Weekday, StartTime)
);

-- ============================================================
-- 7. MATRÍCULA
-- ============================================================

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

-- ============================================================
-- 8. EVALUACIÓN Y SEGUIMIENTO
-- ============================================================

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

-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================
