USE Litaro;
GO

-- ============================================================
-- 1. ENTIDADES INSTITUCIONALES
-- ============================================================

INSERT INTO School (Name, Nit, Address, Phone)
VALUES ('Instituto Nacional Promocion Social', '890.680.025-1', 'Calle 4 No. 3-45 Centro', '8432015');
GO

INSERT INTO Campus (Name, Address, Phone, SchoolId)
VALUES
    ('Sede Principal',    'Calle 4 No. 3-45 Centro',            '8432015', 1),
    ('Sede La Esmeralda', 'Carrera 7 No. 10-12 La Esmeralda',   '8432100', 1),
    ('Sede Rural Tobia',  'Vereda Tobia, Via Principal',         '8432200', 1);
GO

-- ============================================================
-- 2. GESTION TEMPORAL
-- ============================================================

INSERT INTO AcademicYear (YearId, StartDate, EndDate, Status)
VALUES
    (2024, '2024-01-22', '2024-11-29', 'CLOSED'),
    (2025, '2025-01-20', '2025-11-28', 'ACTIVE');
GO

INSERT INTO AcademicPeriod (Periodnumber, StartDate, EndDate, YearId)
VALUES
    (1, '2024-01-22', '2024-03-29', 2024),
    (2, '2024-04-08', '2024-06-14', 2024),
    (3, '2024-06-24', '2024-08-30', 2024),
    (4, '2024-09-09', '2024-11-29', 2024),
    (1, '2025-01-20', '2025-03-28', 2025),
    (2, '2025-04-07', '2025-06-13', 2025),
    (3, '2025-06-23', '2025-08-29', 2025),
    (4, '2025-09-08', '2025-11-28', 2025);
GO

-- ============================================================
-- 3. USUARIOS Y ROLES
-- ============================================================

-- ADMINS
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('CC', '52456789', 'Gloria Patricia', 'Rincon Vargas',   'gloria.rincon@inps-villeta.edu.co',   'hash_placeholder', 'ADMIN', 1),
    ('CC', '79234561', 'Jorge Enrique',   'Castillo Mora',   'jorge.castillo@inps-villeta.edu.co',  'hash_placeholder', 'ADMIN', 2),
    ('CC', '41567890', 'Beatriz Helena',  'Useche Garzon',   'beatriz.useche@inps-villeta.edu.co',  'hash_placeholder', 'ADMIN', 3);
GO

-- DOCENTES
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('CC', '41234567', 'Maria Consuelo',  'Pena Torres',        'maria.pena@inps-villeta.edu.co',        'hash_placeholder', 'TEACHER', 1),
    ('CC', '80345678', 'Carlos Andres',   'Garzon Bermudez',    'carlos.garzon@inps-villeta.edu.co',     'hash_placeholder', 'TEACHER', 1),
    ('CC', '35678901', 'Luz Marina',      'Cifuentes Rojas',    'luz.cifuentes@inps-villeta.edu.co',     'hash_placeholder', 'TEACHER', 1),
    ('CC', '19456789', 'Hernando',        'Bernal Gutierrez',   'hernando.bernal@inps-villeta.edu.co',   'hash_placeholder', 'TEACHER', 1),
    ('CC', '52901234', 'Sandra Milena',   'Lopez Acosta',       'sandra.lopez@inps-villeta.edu.co',      'hash_placeholder', 'TEACHER', 1),
    ('CC', '79012345', 'Jairo Alonso',    'Medina Parra',       'jairo.medina@inps-villeta.edu.co',      'hash_placeholder', 'TEACHER', 1),
    ('CC', '41345678', 'Carmen Rosa',     'Vargas Ospina',      'carmen.vargas@inps-villeta.edu.co',     'hash_placeholder', 'TEACHER', 2),
    ('CC', '80456789', 'Mauricio',        'Calderon Reyes',     'mauricio.calderon@inps-villeta.edu.co', 'hash_placeholder', 'TEACHER', 2),
    ('CC', '52567890', 'Diana Carolina',  'Mahecha Suarez',     'diana.mahecha@inps-villeta.edu.co',     'hash_placeholder', 'TEACHER', 2),
    ('CC', '19678901', 'Giovanny',        'Pinzon Avila',       'giovanny.pinzon@inps-villeta.edu.co',   'hash_placeholder', 'TEACHER', 2),
    ('CC', '41789012', 'Nubia Esperanza', 'Caro Salcedo',       'nubia.caro@inps-villeta.edu.co',        'hash_placeholder', 'TEACHER', 3),
    ('CC', '80890123', 'Ferney',          'Romero Castiblanco', 'ferney.romero@inps-villeta.edu.co',     'hash_placeholder', 'TEACHER', 3);
GO

-- ESTUDIANTES SEDE PRINCIPAL
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('TI', '1061234501', 'Juan Sebastian',  'Morales Pineda',   'juan.morales@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234502', 'Laura Valentina', 'Suarez Ospina',    'laura.suarez@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234503', 'Andres Felipe',   'Castro Hernandez', 'andres.castro@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234504', 'Daniela',         'Ramirez Pedraza',  'daniela.ramirez@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234505', 'Santiago',        'Vargas Molina',    'santiago.vargas@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234506', 'Camila Andrea',   'Pena Guerrero',    'camila.pena@estudiante.inps-villeta.edu.co',     'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234507', 'Nicolas',         'Herrera Fonseca',  'nicolas.herrera@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234508', 'Valentina',       'Gomez Cardenas',   'valentina.gomez@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234509', 'David Esteban',   'Rios Beltran',     'david.rios@estudiante.inps-villeta.edu.co',      'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234510', 'Maria Jose',      'Sanchez Cortes',   'maria.sanchez@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234511', 'Simon',           'Trujillo Leal',    'simon.trujillo@estudiante.inps-villeta.edu.co',  'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234512', 'Isabella',        'Mora Jimenez',     'isabella.mora@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234513', 'Samuel',          'Cifuentes Ardila', 'samuel.cifuentes@estudiante.inps-villeta.edu.co','hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234514', 'Salome',          'Diaz Pinilla',     'salome.diaz@estudiante.inps-villeta.edu.co',     'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234515', 'Tomas',           'Acosta Romero',    'tomas.acosta@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234516', 'Manuela',         'Buitrago Nieto',   'manuela.buitrago@estudiante.inps-villeta.edu.co','hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234517', 'Kevin Andres',    'Melo Naranjo',     'kevin.melo@estudiante.inps-villeta.edu.co',      'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234518', 'Sara Lucia',      'Quintero Vega',    'sara.quintero@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234519', 'Esteban',         'Paez Cuervo',      'esteban.paez@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 1),
    ('TI', '1061234520', 'Gabriela',        'Florez Palacios',  'gabriela.florez@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 1);
GO

-- ESTUDIANTES SEDE LA ESMERALDA
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('TI', '1061234521', 'Valeria',         'Mendez Cortes',    'valeria.mendez@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234522', 'Miguel Angel',    'Torres Quintero',  'miguel.torres@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234523', 'Luisa Fernanda',  'Ceron Mosquera',   'luisa.ceron@estudiante.inps-villeta.edu.co',      'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234524', 'Jeison',          'Alarcon Rubio',    'jeison.alarcon@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234525', 'Natalia',         'Blanco Arenas',    'natalia.blanco@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234526', 'Cristian Camilo', 'Murillo Ossa',     'cristian.murillo@estudiante.inps-villeta.edu.co', 'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234527', 'Yuliana',         'Garzon Pinto',     'yuliana.garzon@estudiante.inps-villeta.edu.co',   'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234528', 'Brayan',          'Pulido Serrano',   'brayan.pulido@estudiante.inps-villeta.edu.co',    'hash_placeholder', 'STUDENT', 2),
    ('TI', '1061234529', 'Alejandra',       'Espinosa Daza',    'alejandra.espinosa@estudiante.inps-villeta.edu.co','hash_placeholder','STUDENT', 2),
    ('TI', '1061234530', 'Juan Camilo',     'Rincon Sabogal',   'juanc.rincon@estudiante.inps-villeta.edu.co',     'hash_placeholder', 'STUDENT', 2);
GO

-- ESTUDIANTES SEDE RURAL TOBIA
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('TI', '1061234531', 'Yerson',          'Calderon Varon',   'yerson.calderon@estudiante.inps-villeta.edu.co',  'hash_placeholder', 'STUDENT', 3),
    ('TI', '1061234532', 'Leidy Johana',    'Medina Quevedo',   'leidy.medina@estudiante.inps-villeta.edu.co',     'hash_placeholder', 'STUDENT', 3),
    ('TI', '1061234533', 'Jhon Fredy',      'Casas Parra',      'jhon.casas@estudiante.inps-villeta.edu.co',       'hash_placeholder', 'STUDENT', 3),
    ('TI', '1061234534', 'Angie Lorena',    'Perez Tovar',      'angie.perez@estudiante.inps-villeta.edu.co',      'hash_placeholder', 'STUDENT', 3),
    ('TI', '1061234535', 'Fabian',          'Rojas Cespedes',   'fabian.rojas@estudiante.inps-villeta.edu.co',     'hash_placeholder', 'STUDENT', 3);
GO

-- ACUDIENTES
INSERT INTO [User] (DocumentType, DocumentNumber, FirstName, LastName, Email, PasswordHash, Role, CampusId)
VALUES
    ('CC', '52111001', 'Rosa Elena',       'Pineda Galvis',     'rosa.pineda@gmail.com',           'hash_placeholder', 'PARENT', 1),
    ('CC', '79111002', 'Fabio Ernesto',    'Suarez Leal',       'fabio.suarez@gmail.com',          'hash_placeholder', 'PARENT', 1),
    ('CC', '41111003', 'Claudia Marcela',  'Hernandez Rios',    'claudia.hernandez@gmail.com',     'hash_placeholder', 'PARENT', 1),
    ('CC', '52111004', 'Esperanza',        'Pedraza Sanchez',   'esperanza.pedraza@gmail.com',     'hash_placeholder', 'PARENT', 1),
    ('CC', '19111005', 'Rodrigo',          'Molina Cardona',    'rodrigo.molina@gmail.com',        'hash_placeholder', 'PARENT', 1),
    ('CC', '41111006', 'Nubia',            'Guerrero Salinas',  'nubia.guerrero@gmail.com',        'hash_placeholder', 'PARENT', 1),
    ('CC', '79111007', 'Gustavo',          'Fonseca Rubio',     'gustavo.fonseca@gmail.com',       'hash_placeholder', 'PARENT', 1),
    ('CC', '52111008', 'Luz Dary',         'Cardenas Murillo',  'luz.cardenas@gmail.com',          'hash_placeholder', 'PARENT', 1),
    ('CC', '19111009', 'Wilson',           'Beltran Cano',      'wilson.beltran@gmail.com',        'hash_placeholder', 'PARENT', 1),
    ('CC', '41111010', 'Amparo',           'Cortes Jimenez',    'amparo.cortes@gmail.com',         'hash_placeholder', 'PARENT', 1),
    ('CC', '79111011', 'Henry',            'Leal Mahecha',      'henry.leal@gmail.com',            'hash_placeholder', 'PARENT', 1),
    ('CC', '52111012', 'Marleny',          'Nieto Castellanos', 'marleny.nieto@gmail.com',         'hash_placeholder', 'PARENT', 1),
    ('CC', '19111013', 'Omar',             'Naranjo Restrepo',  'omar.naranjo@gmail.com',          'hash_placeholder', 'PARENT', 1),
    ('CC', '41111014', 'Patricia',         'Vega Ocampo',       'patricia.vega@gmail.com',         'hash_placeholder', 'PARENT', 1),
    ('CC', '79111015', 'Alirio',           'Cuervo Mendoza',    'alirio.cuervo@gmail.com',         'hash_placeholder', 'PARENT', 1),
    ('CC', '52111016', 'Olga Lucia',       'Palacios Hurtado',  'olga.palacios@gmail.com',         'hash_placeholder', 'PARENT', 1),
    ('CC', '41111017', 'Flor Maria',       'Arenas Castillo',   'flor.arenas@gmail.com',           'hash_placeholder', 'PARENT', 2),
    ('CC', '80111018', 'Luis Alfredo',     'Quintero Avila',    'luis.quintero@gmail.com',         'hash_placeholder', 'PARENT', 2),
    ('CC', '52111019', 'Consuelo',         'Mosquera Marin',    'consuelo.mosquera@gmail.com',     'hash_placeholder', 'PARENT', 2),
    ('CC', '79111020', 'Edgar',            'Rubio Chaparro',    'edgar.rubio@gmail.com',           'hash_placeholder', 'PARENT', 2),
    ('CC', '80111021', 'Jaime',            'Ossa Bedoya',       'jaime.ossa@gmail.com',            'hash_placeholder', 'PARENT', 2),
    ('CC', '52111022', 'Rocio',            'Pinto Ballesteros', 'rocio.pinto@gmail.com',           'hash_placeholder', 'PARENT', 2),
    ('CC', '79111023', 'Helber',           'Serrano Mora',      'helber.serrano@gmail.com',        'hash_placeholder', 'PARENT', 2),
    ('CC', '41111024', 'Yaneth',           'Daza Perilla',      'yaneth.daza@gmail.com',           'hash_placeholder', 'PARENT', 2),
    ('CC', '80111025', 'Alirio',           'Sabogal Useche',    'alirio.sabogal@gmail.com',        'hash_placeholder', 'PARENT', 2),
    ('CC', '52111026', 'Myriam',           'Varon Pulido',      'myriam.varon@gmail.com',          'hash_placeholder', 'PARENT', 3),
    ('CC', '79111027', 'Fredy',            'Quevedo Rincon',    'fredy.quevedo@gmail.com',         'hash_placeholder', 'PARENT', 3),
    ('CC', '41111028', 'Cecilia',          'Parra Acosta',      'cecilia.parra@gmail.com',         'hash_placeholder', 'PARENT', 3),
    ('CC', '80111029', 'Edilberto',        'Tovar Guarin',      'edilberto.tovar@gmail.com',       'hash_placeholder', 'PARENT', 3),
    ('CC', '52111030', 'Luz Marina',       'Cespedes Vargas',   'luz.cespedes@gmail.com',          'hash_placeholder', 'PARENT', 3);
GO

INSERT INTO Teacher (TeacherId, Specialty)
VALUES
    (4,  'Matematicas'),
    (5,  'Ciencias Naturales'),
    (6,  'Lengua Castellana'),
    (7,  'Ciencias Sociales'),
    (8,  'Educacion Fisica'),
    (9,  'Ingles'),
    (10, 'Matematicas'),
    (11, 'Lengua Castellana'),
    (12, 'Ciencias Naturales'),
    (13, 'Ciencias Sociales'),
    (14, 'Educacion Fisica'),
    (15, 'Matematicas');
GO

INSERT INTO Student (StudentId, StudentCode, BirthDate, Gender)
VALUES
    (16, 'INPS-2025-001', '2010-03-15', 'M'),
    (17, 'INPS-2025-002', '2010-07-22', 'F'),
    (18, 'INPS-2025-003', '2009-11-08', 'M'),
    (19, 'INPS-2025-004', '2010-01-30', 'F'),
    (20, 'INPS-2025-005', '2009-05-17', 'M'),
    (21, 'INPS-2025-006', '2010-08-25', 'F'),
    (22, 'INPS-2025-007', '2009-12-01', 'M'),
    (23, 'INPS-2025-008', '2010-04-14', 'F'),
    (24, 'INPS-2025-009', '2009-09-20', 'M'),
    (25, 'INPS-2025-010', '2010-06-11', 'F'),
    (26, 'INPS-2025-011', '2008-02-28', 'M'),
    (27, 'INPS-2025-012', '2008-10-05', 'F'),
    (28, 'INPS-2025-013', '2007-07-19', 'M'),
    (29, 'INPS-2025-014', '2007-03-23', 'F'),
    (30, 'INPS-2025-015', '2006-11-30', 'M'),
    (31, 'INPS-2025-016', '2006-08-12', 'F'),
    (32, 'INPS-2025-017', '2005-04-07', 'M'),
    (33, 'INPS-2025-018', '2005-09-18', 'F'),
    (34, 'INPS-2025-019', '2004-12-25', 'M'),
    (35, 'INPS-2025-020', '2004-06-03', 'F'),
    (36, 'INPS-2025-021', '2010-02-17', 'F'),
    (37, 'INPS-2025-022', '2009-08-30', 'M'),
    (38, 'INPS-2025-023', '2010-05-22', 'F'),
    (39, 'INPS-2025-024', '2009-01-14', 'M'),
    (40, 'INPS-2025-025', '2010-11-09', 'F'),
    (41, 'INPS-2025-026', '2008-07-26', 'M'),
    (42, 'INPS-2025-027', '2009-03-31', 'F'),
    (43, 'INPS-2025-028', '2008-12-16', 'M'),
    (44, 'INPS-2025-029', '2007-09-08', 'F'),
    (45, 'INPS-2025-030', '2009-04-20', 'M'),
    (46, 'INPS-2025-031', '2011-01-10', 'M'),
    (47, 'INPS-2025-032', '2010-08-03', 'F'),
    (48, 'INPS-2025-033', '2009-06-27', 'M'),
    (49, 'INPS-2025-034', '2010-03-19', 'F'),
    (50, 'INPS-2025-035', '2008-11-14', 'M');
GO

INSERT INTO Parent (ParentId, Relationship)
VALUES
    (51, 'MOTHER'), (52, 'FATHER'), (53, 'MOTHER'), (54, 'MOTHER'), (55, 'FATHER'),
    (56, 'MOTHER'), (57, 'FATHER'), (58, 'MOTHER'), (59, 'FATHER'), (60, 'MOTHER'),
    (61, 'FATHER'), (62, 'MOTHER'), (63, 'FATHER'), (64, 'MOTHER'), (65, 'FATHER'),
    (66, 'MOTHER'), (67, 'MOTHER'), (68, 'FATHER'), (69, 'MOTHER'), (70, 'FATHER'),
    (71, 'MOTHER'), (72, 'FATHER'), (73, 'MOTHER'), (74, 'FATHER'), (75, 'MOTHER'),
    (76, 'MOTHER'), (77, 'FATHER'), (78, 'MOTHER'), (79, 'FATHER'), (80, 'MOTHER');
GO

-- ============================================================
-- 4. RELACION PADRE - ESTUDIANTE (N:M)
-- ============================================================

INSERT INTO ParentStudent (ParentId, StudentId, PrimaryContact)
VALUES
    (51, 16, 1), (52, 17, 1), (53, 18, 1), (54, 19, 1), (55, 20, 1),
    (56, 21, 1), (57, 22, 1), (58, 23, 1), (59, 24, 1), (60, 25, 1),
    (61, 26, 1), (62, 27, 1), (63, 28, 1), (64, 29, 1), (65, 30, 1),
    (66, 31, 1), (67, 32, 1), (68, 33, 1), (69, 34, 1), (70, 35, 1),
    (71, 36, 1), (72, 37, 1), (73, 38, 1), (74, 39, 1), (75, 40, 1),
    (76, 41, 1), (77, 42, 1), (78, 43, 1), (79, 44, 1), (80, 45, 1),
    (51, 46, 0),
    (76, 47, 1),
    (78, 48, 1),
    (79, 49, 1),
    (80, 50, 1);
GO

-- ============================================================
-- 5. ESTRUCTURA ACADEMICA
-- ============================================================

INSERT INTO Grade (Name, OrderNum, Level)
VALUES
    ('Primero',  1,  'ELEMENTARY'),
    ('Segundo',  2,  'ELEMENTARY'),
    ('Tercero',  3,  'ELEMENTARY'),
    ('Cuarto',   4,  'ELEMENTARY'),
    ('Quinto',   5,  'ELEMENTARY'),
    ('Sexto',    6,  'MIDDLE'),
    ('Septimo',  7,  'MIDDLE'),
    ('Octavo',   8,  'MIDDLE'),
    ('Noveno',   9,  'MIDDLE'),
    ('Decimo',   10, 'HIGH'),
    ('Undecimo', 11, 'HIGH');
GO

INSERT INTO Classroom (Name, GradeId, CampusId)
VALUES
    ('6A',  6,  1),
    ('6B',  6,  1),
    ('7A',  7,  1),
    ('7B',  7,  1),
    ('8A',  8,  1),
    ('9A',  9,  1),
    ('10A', 10, 1),
    ('11A', 11, 1),
    ('6A',  6,  2),
    ('7A',  7,  2),
    ('10A', 10, 2),
    ('11A', 11, 2),
    ('5A',  5,  3),
    ('6A',  6,  3),
    ('7A',  7,  3);
GO

INSERT INTO Subject (Name, WeeklyHours, knowledgeArea)
VALUES
    ('Matematicas',       5, 'Ciencias Exactas'),
    ('Lengua Castellana', 5, 'Humanidades'),
    ('Ciencias Naturales',4, 'Ciencias Naturales'),
    ('Ciencias Sociales', 4, 'Ciencias Sociales'),
    ('Educacion Fisica',  2, 'Educacion Fisica'),
    ('Ingles',            3, 'Humanidades'),
    ('Etica y Valores',   2, 'Humanidades'),
    ('Tecnologia',        2, 'Ciencias Exactas'),
    ('Artistica',         2, 'Humanidades');
GO

-- ============================================================
-- 6. ASIGNACION ACADEMICA
-- ============================================================

INSERT INTO AcademicAssignment (ClassroomId, SubjectId, TeacherId, YearId)
VALUES
    (1,  1, 4,  2025), (1,  2, 6,  2025), (1,  3, 5,  2025),
    (1,  4, 7,  2025), (1,  5, 8,  2025), (1,  6, 9,  2025),
    (2,  1, 4,  2025), (2,  2, 6,  2025), (2,  3, 5,  2025),
    (3,  1, 4,  2025), (3,  2, 6,  2025), (3,  3, 5,  2025), (3,  4, 7,  2025),
    (7,  1, 4,  2025), (7,  2, 6,  2025), (7,  6, 9,  2025),
    (8,  1, 4,  2025), (8,  2, 6,  2025),
    (9,  1, 10, 2025), (9,  2, 11, 2025), (9,  3, 12, 2025),
    (9,  4, 13, 2025), (9,  5, 14, 2025),
    (10, 1, 10, 2025), (10, 2, 11, 2025),
    (13, 1, 15, 2025), (13, 2, 15, 2025), (13, 3, 15, 2025);
GO

INSERT INTO Schedule (AssignmentId, Weekday, StartTime, EndTime)
VALUES
    (1,  1, '07:00', '08:00'), (1,  3, '07:00', '08:00'), (1,  5, '07:00', '08:00'),
    (2,  2, '07:00', '08:00'), (2,  4, '07:00', '08:00'),
    (3,  1, '08:00', '09:00'), (3,  3, '08:00', '09:00'),
    (4,  2, '08:00', '09:00'), (4,  4, '08:00', '09:00'),
    (5,  5, '09:00', '10:00'),
    (6,  1, '09:00', '10:00'), (6,  3, '09:00', '10:00'),
    (10, 1, '07:00', '08:00'), (10, 3, '07:00', '08:00'), (10, 5, '07:00', '08:00'),
    (11, 2, '07:00', '08:00'), (11, 4, '07:00', '08:00'),
    (19, 1, '07:00', '08:00'), (19, 3, '07:00', '08:00'), (19, 5, '07:00', '08:00'),
    (20, 2, '07:00', '08:00'), (20, 4, '07:00', '08:00'),
    (26, 1, '07:00', '08:00'), (26, 3, '07:00', '08:00'),
    (27, 2, '07:00', '08:00'), (27, 4, '07:00', '08:00'),
    (28, 5, '07:00', '08:00');
GO

-- ============================================================
-- 7. MATRICULA
-- ============================================================

INSERT INTO Enrollment (StudentId, ClassroomId, YearId, Status)
VALUES
    (16, 1,  2025, 'ACTIVE'), (17, 1,  2025, 'ACTIVE'), (18, 1,  2025, 'ACTIVE'),
    (19, 1,  2025, 'ACTIVE'), (20, 1,  2025, 'ACTIVE'),
    (21, 2,  2025, 'ACTIVE'), (22, 2,  2025, 'ACTIVE'), (23, 2,  2025, 'ACTIVE'),
    (24, 2,  2025, 'ACTIVE'),
    (25, 3,  2025, 'ACTIVE'), (26, 3,  2025, 'ACTIVE'), (27, 3,  2025, 'ACTIVE'),
    (28, 5,  2025, 'ACTIVE'), (29, 5,  2025, 'ACTIVE'),
    (30, 7,  2025, 'ACTIVE'), (31, 7,  2025, 'ACTIVE'),
    (32, 8,  2025, 'ACTIVE'), (33, 8,  2025, 'ACTIVE'), (34, 8,  2025, 'ACTIVE'),
    (35, 8,  2025, 'ACTIVE'),
    (36, 9,  2025, 'ACTIVE'), (37, 9,  2025, 'ACTIVE'), (38, 9,  2025, 'ACTIVE'),
    (39, 9,  2025, 'ACTIVE'), (40, 9,  2025, 'ACTIVE'),
    (41, 10, 2025, 'ACTIVE'), (42, 10, 2025, 'ACTIVE'), (43, 10, 2025, 'ACTIVE'),
    (44, 10, 2025, 'ACTIVE'), (45, 10, 2025, 'ACTIVE'),
    (46, 13, 2025, 'ACTIVE'), (47, 13, 2025, 'ACTIVE'), (48, 13, 2025, 'ACTIVE'),
    (49, 13, 2025, 'ACTIVE'), (50, 13, 2025, 'ACTIVE');
GO

-- ============================================================
-- 8. EVALUACION Y SEGUIMIENTO
-- ============================================================

INSERT INTO GradeScore (EnrollmentId, SubjectId, PeriodId, Value, Description)
VALUES
    (1,  1, 5, 4.50, 'Buen desempeno en algebra basica'),
    (1,  2, 5, 3.80, 'Mejoro comprension lectora'),
    (1,  3, 5, 4.20, 'Excelente participacion en laboratorio'),
    (1,  4, 5, 4.00, 'Buen analisis de temas historicos'),
    (1,  5, 5, 4.80, 'Destacado en actividades deportivas'),
    (2,  1, 5, 3.50, 'Dificultades en fracciones, requiere refuerzo'),
    (2,  2, 5, 4.70, 'Sobresaliente en produccion textual'),
    (2,  3, 5, 4.00, 'Buen manejo de conceptos basicos'),
    (2,  4, 5, 3.90, 'Participa activamente en clase'),
    (3,  1, 5, 4.00, 'Desempeno alto en geometria'),
    (3,  2, 5, 3.60, 'Desempeno basico, debe mejorar ortografia'),
    (3,  3, 5, 3.90, 'Participa activamente'),
    (4,  1, 5, 2.80, 'Requiere refuerzo en geometria y fracciones'),
    (4,  2, 5, 3.60, 'Desempeno basico'),
    (4,  4, 5, 4.10, 'Muy buen analisis en ciencias sociales'),
    (5,  1, 5, 4.80, 'Desempeno superior en todas las areas'),
    (5,  2, 5, 4.30, 'Muy buen analisis y comprension'),
    (5,  3, 5, 4.60, 'Excelente en ciencias naturales'),
    (6,  1, 5, 3.70, 'Desempeno basico alto'),
    (6,  2, 5, 4.20, 'Buena produccion escrita'),
    (7,  1, 5, 4.30, 'Muy buen desempeno'),
    (7,  2, 5, 3.50, 'Debe mejorar comprension lectora'),
    (8,  1, 5, 3.90, 'Desempeno alto'),
    (8,  2, 5, 4.00, 'Buena participacion'),
    (9,  1, 5, 2.60, 'Bajo desempeno, requiere apoyo urgente'),
    (9,  2, 5, 3.10, 'Dificultades en comprension de textos'),
    (10, 1, 5, 4.50, 'Excelente en algebra'),
    (10, 2, 5, 4.80, 'Sobresaliente en lengua castellana'),
    (11, 1, 5, 3.20, 'Bajo desempeno, requiere apoyo'),
    (11, 2, 5, 3.80, 'Mejoro en el periodo'),
    (12, 1, 5, 4.10, 'Buen desempeno general'),
    (12, 2, 5, 3.70, 'Desempeno alto'),
    (15, 1, 5, 4.90, 'Desempeno superior en calculo'),
    (15, 2, 5, 4.50, 'Excelente en analisis de textos'),
    (16, 1, 5, 4.20, 'Buen desempeno en estadistica'),
    (16, 2, 5, 3.90, 'Desempeno alto'),
    (17, 1, 5, 3.80, 'Desempeno basico alto'),
    (17, 2, 5, 4.10, 'Buena participacion en clase'),
    (21, 1, 5, 4.10, 'Buen desempeno general'),
    (21, 2, 5, 4.40, 'Muy buena comprension lectora'),
    (22, 1, 5, 3.60, 'Desempeno basico'),
    (22, 2, 5, 3.80, 'Mejoro en produccion textual'),
    (31, 1, 5, 3.80, 'Desempeno basico alto'),
    (31, 2, 5, 4.00, 'Buena participacion'),
    (32, 1, 5, 3.50, 'Dificultades en matematicas'),
    (32, 2, 5, 3.90, 'Buena comprension lectora');
GO

INSERT INTO Attendance (EnrollmentId, SubjectId, Date, Status, Observation)
VALUES
    (1,  1, '2025-01-20', 'PRESENT', NULL),
    (1,  1, '2025-01-22', 'PRESENT', NULL),
    (1,  1, '2025-01-27', 'ABSENT',  'Incapacidad medica'),
    (1,  2, '2025-01-21', 'PRESENT', NULL),
    (1,  2, '2025-01-23', 'PRESENT', NULL),
    (2,  1, '2025-01-20', 'PRESENT', NULL),
    (2,  1, '2025-01-22', 'LATE',    'Llego 15 minutos tarde sin justificacion'),
    (2,  1, '2025-01-27', 'PRESENT', NULL),
    (3,  1, '2025-01-20', 'PRESENT', NULL),
    (3,  1, '2025-01-22', 'PRESENT', NULL),
    (4,  1, '2025-01-20', 'ABSENT',  'Sin justificacion'),
    (4,  1, '2025-01-22', 'ABSENT',  'Sin justificacion'),
    (4,  2, '2025-01-21', 'PRESENT', NULL),
    (5,  1, '2025-01-20', 'PRESENT', NULL),
    (5,  1, '2025-01-22', 'PRESENT', NULL),
    (5,  3, '2025-01-20', 'PRESENT', NULL),
    (6,  1, '2025-01-20', 'PRESENT', NULL),
    (6,  2, '2025-01-21', 'LATE',    'Transporte escolar con retraso'),
    (7,  1, '2025-01-20', 'PRESENT', NULL),
    (7,  1, '2025-01-22', 'ABSENT',  'Permiso por cita medica'),
    (9,  1, '2025-01-20', 'ABSENT',  'Sin justificacion'),
    (9,  1, '2025-01-22', 'ABSENT',  'Sin justificacion'),
    (9,  1, '2025-01-27', 'ABSENT',  'Sin justificacion'),
    (10, 1, '2025-01-20', 'PRESENT', NULL),
    (10, 2, '2025-01-21', 'PRESENT', NULL),
    (11, 1, '2025-01-20', 'ABSENT',  'Sin justificacion'),
    (11, 1, '2025-01-22', 'ABSENT',  'Sin justificacion'),
    (15, 1, '2025-01-20', 'PRESENT', NULL),
    (15, 2, '2025-01-21', 'PRESENT', NULL),
    (21, 1, '2025-01-20', 'PRESENT', NULL),
    (21, 2, '2025-01-21', 'PRESENT', NULL),
    (22, 1, '2025-01-20', 'LATE',    'Dificultades de transporte en la zona'),
    (31, 1, '2025-01-20', 'PRESENT', NULL),
    (31, 2, '2025-01-21', 'LATE',    'Vive en zona rural de dificil acceso'),
    (32, 1, '2025-01-20', 'ABSENT',  'Sin justificacion'),
    (32, 2, '2025-01-21', 'PRESENT', NULL);
GO

INSERT INTO StudentLog (EnrollmentId, Date, Type, Observation, UserRecordedId)
VALUES
    (4,  '2025-02-05', 'ACADEMIC',     'El estudiante presenta inasistencias reiteradas y bajo rendimiento en matematicas. Se cita acudiente para el 10 de febrero.',                              4),
    (2,  '2025-02-10', 'DISCIPLINARY', 'Conflicto menor con companero en el descanso. Se realizo dialogo de convivencia con la directora de grupo.',                                              6),
    (1,  '2025-03-01', 'ACHIEVEMENT',  'Gano primer puesto en concurso intermunicipal de matematicas realizado en Villeta. Representara al INPS en la fase departamental.',                       4),
    (3,  '2025-03-15', 'COEXISTENCE',  'Participo voluntariamente como mediador en jornada de convivencia escolar del grado sexto.',                                                              6),
    (5,  '2025-03-20', 'ACHIEVEMENT',  'Reconocimiento por mejor promedio academico del primer periodo en el grado 6A con un promedio de 4.7.',                                                   4),
    (11, '2025-02-18', 'ACADEMIC',     'Acumula 4 inasistencias injustificadas en matematicas. Se remite a orientacion escolar y se notifica al acudiente.',                                      4),
    (7,  '2025-03-05', 'DISCIPLINARY', 'Uso de celular en clase de lengua castellana. Llamado de atencion verbal registrado en el observador del estudiante.',                                    6),
    (15, '2025-03-25', 'ACHIEVEMENT',  'Seleccionado para representar al colegio en las olimpiadas de matematicas de Cundinamarca organizadas por la Secretaria de Educacion Departamental.',    4),
    (21, '2025-02-28', 'COEXISTENCE',  'Apoyo activo en campana de cuidado del medio ambiente realizada en la sede La Esmeralda. Ejemplo de liderazgo estudiantil.',                             10),
    (31, '2025-03-10', 'ACADEMIC',     'Presenta dificultades de aprendizaje asociadas a la distancia de la zona rural. Se gestiona apoyo con el programa de educacion flexible de la SED.',     15),
    (9,  '2025-02-25', 'ACADEMIC',     'Tres inasistencias consecutivas sin justificacion. Se realiza visita domiciliaria y se contacta al acudiente por telefono.',                              4),
    (17, '2025-03-12', 'ACHIEVEMENT',  'Clasifico al torneo interescolar de futbol que se realizara en La Vega Cundinamarca en representacion del INPS sede principal.',                         8),
    (22, '2025-03-18', 'COEXISTENCE',  'Participo activamente en la jornada de integracion entre las sedes del colegio organizada por el consejo estudiantil.',                                  10),
    (32, '2025-02-20', 'ACADEMIC',     'Estudiante de zona rural con dificultades de conectividad para actividades virtuales. Se acuerda plan de trabajo alternativo con el docente.',            15),
    (4,  '2025-03-28', 'DISCIPLINARY', 'Segunda intervencion por inasistencias. Se firma compromiso de asistencia con el acudiente y la coordinadora de la sede.',                               6);
GO

<<<<<<< Updated upstream

INSERT INTO AuditLog ( TableName, RecordId, ActionType, OldValues, NewValues, ChangedBy)
VALUES
('School', '1', 'I', NULL, '{"Name":"Instituto Nacional Promocion Social"}', 1),
('School', '1', 'U', '{"Phone":"8432015"}', '{"Phone":"8439999"}', 2),
('School', '1', 'U', '{"Address":"Calle 4 No. 3-45 Centro"}', '{"Address":"Carrera 5 No. 4-20"}', 2),
('Campus', '2', 'I', NULL, '{"Name":"Sede La Esmeralda"}', 1),
('Campus', '3', 'U', '{"Phone":"8432200"}', '{"Phone":"8432210"}', 3),
('User', '4', 'I', NULL, '{"FirstName":"Maria Consuelo","Role":"TEACHER"}', 1),
('User', '16', 'U', '{"Email":"juan.morales@estudiante.inps-villeta.edu.co"}', '{"Email":"juan.morales2025@estudiante.inps-villeta.edu.co"}', 4),
('Enrollment', '1', 'I', NULL, '{"StudentId":16,"ClassroomId":1,"YearId":2025}', 1),
('GradeScore', '1', 'U', '{"Value":4.50}', '{"Value":4.80}', 4),
('School', '1', 'D', '{"Name":"Instituto Nacional Promocion Social","Phone":"8439999"}', NULL, 3);
GO

=======
INSERT INTO Utility (Page, SubPage, Section, ContentKey, DataArray)
VALUES
(
    'HomePage',
    'Home',
    'Levels',
    'List',
    '[
        {
            "title":"Primaria",
            "description":"Grados de primero a quinto"
        }
    ]'
),
(
    'HomePage',
    'Home',
    'Events',
    'List',
    '[
        {
            "title":"Dia de la Independencia",
            "date":"2026-07-20"
        }
    ]'
),
(
    'HomePage',
    'AboutUs',
    'Professors',
    'List',
    '[
        {
            "name":"Juan Rodriguez",
            "role":"Profesor de Filosofia"
        }
    ]'
);
GO
>>>>>>> Stashed changes
-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================