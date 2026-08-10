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