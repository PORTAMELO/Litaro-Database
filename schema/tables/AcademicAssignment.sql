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