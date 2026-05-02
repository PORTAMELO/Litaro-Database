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