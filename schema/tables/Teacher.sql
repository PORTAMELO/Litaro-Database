CREATE TABLE Teacher (
    TeacherId       INT                     NOT NULL,
    Specialty       NVARCHAR(100)           NOT NULL,
    CONSTRAINT      PKTeacher               PRIMARY KEY (TeacherId),
    CONSTRAINT      FKTeacherUser           FOREIGN KEY (TeacherId) REFERENCES [User](UserId)
);
GO