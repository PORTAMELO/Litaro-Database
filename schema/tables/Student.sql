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