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