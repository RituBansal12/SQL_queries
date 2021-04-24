CREATE TABLE Student
    ([STUD_ID] int, [Name] varchar(25), [Class] int)
;

INSERT INTO Student
    ([STUD_ID], [Name], [Class])
VALUES
    (1, 'A', 1),
    (2, 'B', 1),
    (3, 'C', 1),
    (4, 'D', 1),
    (5, 'E', 2),
    (6, 'F', 2),
    (7, 'G', 2)
;

CREATE table subject
    ([SUB_ID] int, [Sub_Name] varchar(25), [Class] int)
;

INSERT INTO subject
    ([SUB_ID], [Sub_Name], [Class])
VALUES
    (10, 'ab', 1),
    (20, 'cd', 1),
    (30, 'ef', 1),
    (40, 'gh', 2),
    (50, 'ij', 2),
    (60, 'kl', 2)
;

CREATE table Performance
    ([STUD_ID] int, [SUB_ID] int, [Marks] int)
;

INSERT INTO Performance
    ([STUD_ID], [SUB_ID], [Marks])
VALUES
    (1, 10, 56),
    (1, 20, 64),
    (1, 30, 76),
    (2, 10, 65),
    (2, 20, 46),
    (2, 30, 78),
    (3, 10, 46),
    (3, 20, 60),
    (3, 30, 70),
    (4, 10, 65),
    (4, 20, 68),
    (4, 30, 67),
    (5, 40, 56),
    (5, 50, 64),
    (5, 60, 76),
    (6, 40, 65),
    (6, 50, 60),
    (6, 60, 80),
    (7, 40, 50),
    (7, 50, 60),
    (7, 60, 76)
;

CREATE table abc ([ID] int, [name] varchar(25), [class] int, [average] int);


INSERT INTO abc
SELECT Student.STUD_ID, Student.Name, Student.Class, sum(Performance.Marks)
FROM ((Student
INNER JOIN subject ON Student.Class = subject.Class)
INNER JOIN Performance ON subject.SUB_ID = Performance.SUB_ID AND Performance.STUD_ID = Student.STUD_ID)
group by Student.STUD_ID
;

SELECT ID, name, class, max(average)
FROM abc
group by(class);
