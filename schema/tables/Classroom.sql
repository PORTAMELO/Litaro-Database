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