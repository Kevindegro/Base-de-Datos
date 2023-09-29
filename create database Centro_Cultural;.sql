drop database Centro_Cultural;
create database Centro_Cultural;
use Centro_Cultural;

create table Epoca(
Nombre varchar (20) not null primary key,
Caracteristicas varchar (100) null,
A_inicio int (4) not null,
A_final int (4) not null,
Genero_Epoca varchar (20) not null
);

create table Genero(
Nombre varchar (20) not null primary key,
Caracteristicas varchar (100) null,
Origen varchar (200) NULL,
Instrumento varchar (100) not null,
Musicos varchar (20) not null,
Epoca varchar (20) not null,
Instrumento varchar (20) not null,
foreign key (Epoca) REFERENCES Epoca (Nombre),
foreign key (Musicos) REFERENCES Musico (Nombre),
foreign key (Instrumento) REFERENCES Instrumento(Nombre)
);

create table Musico(
Nombre varchar (20) not null primary key,
F_nacimiento date not null,
F_muerte date null,
Historia varchar (200) null,
Genero varchar (20) not null,
foreign key (Genero) REFERENCES Genero(Nombre)
);

create table Instrumento(
Nombre varchar (20) not null primary key,
Foto varchar (1) null,
U_creacion varchar (40) not null,
Creador varchar (20) not null,
Tipo varchar (20) not null,
Material varchar (20) null
);

create table Musico, Obras Famosas(
Nombre_Musico varchar (20) not null primary key,
Nombre_obra varchar (20) not null primary key,
foreign key (Nombre_Musico) REFERENCES Musico(Nombre),
foreign key (Nombre_obra) REFERENCES Nombre_obra(Nombre)
);

create table Obras_Famosas(
Nombre varchar (20) not null primary key,
F_creacion int (4) not null,
Partitura varchar (200) null,
Genero varchar (20) not null,
foreign key (Genero) REFERENCES Genero(Nombre)
);


INSERT INTO Epoca (Nombre, Caracteristicas, A_inicio, A_final, Genero_Epoca)
VALUES
    ('Antigua', 'Época histórica marcada por civilizaciones como Egipto y Roma', -3000, 476, 'Clásica'),
    ('Renacimiento', 'Período de florecimiento cultural y artístico', 1300, 1600, 'Renacimiento'),
    ('Barroco', 'Época musical caracterizada por la ornamentación y la ópera', 1600, 1750, 'Clásica'),
    ('Romanticismo', 'Época de expresión emocional en la música y grandes sinfonías', 1820, 1910, 'Romanticismo'),
    ('Jazz Era', 'Época del jazz con improvisación y ritmos africanos', 1920, 1930, 'Jazz'),
    ('Rock & Roll', 'Época de revolución musical y el surgimiento del rock', 1950, 1960, 'Rock'),
    ('Era del Hip-Hop', 'Época del hip-hop y la cultura urbana', 1980, 2000, 'Hip-Hop'),
    ('Clásica', 'Época de música orquestal y compositores como Mozart y Beethoven', 1750, 1820, 'Clásica'),
    ('Salsa', 'Época de la salsa y la música latina', 1970, 1980, 'Salsa'),
    ('Siglo XX', 'Época de experimentación en la música y avances tecnológicos', 1900, 2000, 'Siglo XX');
    
INSERT INTO Genero (Nombre, Caracteristicas, Origen, Instrumento, Epoca)
VALUES
    ('Rock', 'Genero caracterizado por guitarras electricas y ritmos energicos', 'Estados Unidos', 'Guitarra electrica', 'Rock & Roll'),
    ('Clasica', 'Musica compuesta para orquestas y ensembles', 'Varios paises', 'Instrumentos orquestales', 'Clasicismo'),
    ('Jazz', 'Genero musical improvisado con influencias africanas', 'Estados Unidos', 'Saxofon, Trompeta', 'Jazz Era'),
    ('Hip-Hop', 'Musica basada en el rap y la cultura urbana', 'Estados Unidos', 'Turntables, Microfono', 'Era del Hip-Hop'),
    ('Pop', 'Musica popular con enfasis en la melodia y el gancho', 'Varios paises', 'Varios instrumentos', 'Siglo XX'),
    ('Electronica', 'Musica creada con sintetizadores y dispositivos electronicos', 'Varios paises', 'Sintetizador', 'Siglo XX'),
    ('Reggae', 'Genero jamaicano con un ritmo caracteristico', 'Jamaica', 'Guitarra, Bajo', 'Siglo XX'),
    ('Salsa', 'Genero de baile latino con influencias caribeñas', 'Varios paises', 'Percusion, Trombon', 'Siglo XX'),
    ('Country', 'Musica con raices en la musica folklorica estadounidense', 'Estados Unidos', 'Guitarra acustica', 'Siglo XX'),
    ('R&B', 'Rhythm and Blues con influencias del soul y el jazz', 'Estados Unidos', 'Piano, Voz', 'Siglo XX');

INSERT INTO Musico (Nombre, F_nacimiento, F_muerte, Historia, Genero)
VALUES
    ('Ludwig van Beethoven', '1770-12-17', '1827-03-26', 'Compositor y pianista aleman, una de las figuras mas influyentes en la musica clasica.', 'Clasica'),
    ('Elvis Presley', '1935-01-08', '1977-08-16', 'Conocido como el Rey del Rock and Roll, fue un influyente cantante y actor estadounidense.', 'Rock'),
    ('Miles Davis', '1926-05-26', '1991-09-28', 'Innovador del jazz y destacado trompetista y compositor estadounidense.', 'Jazz'),
    ('Bob Marley', '1945-02-06', '1981-05-11', 'Lider del movimiento reggae, fue un influyente cantante y compositor jamaicano.', 'Reggae'),
    ('Michael Jackson', '1958-08-29', '2009-06-25', 'Reconocido como el Rey del Pop, fue un iconico cantante, compositor y bailarin estadounidense.', 'Pop'),
    ('Johnny Cash', '1932-02-26', '2003-09-12', 'Figura destacada en la musica country y folk estadounidense, conocido como el Hombre de Negro.', 'Country'),
    ('Aretha Franklin', '1942-03-25', '2018-08-16', 'La Reina del Soul, cantante y pianista estadounidense con una voz poderosa.', 'R&B'),
    ('Daft Punk', '1993-01-01', '2021-02-22', 'Duo de musica electronica frances conocido por su estilo unico y cascos.', 'Electronica'),
    ('Santana', '1947-07-20', NULL, 'Guitarrista mexicano-estadounidense conocido por su fusion de rock y musica latina.', 'Rock'),
    ('Celia Cruz', '1925-10-21', '2003-07-16', 'La Reina de la Salsa, cantante cubana con una carrera internacional destacada.', 'Salsa');

INSERT INTO Instrumento (Nombre, U_creacion, Creador, Tipo, Material)
VALUES
    ('Piano', 'Año 1700', 'Bartolomeo Cristofori', 'Teclado', 'Madera y metal'),
    ('Guitarra', 'Siglo XV', 'Anonimo', 'Cuerda', 'Madera y metal'),
    ('Violin', 'Siglo XVI', 'Andrea Amati', 'Cuerda', 'Madera'),
    ('Trompeta', 'Siglo XV', 'Anonimo', 'Viento-metal', 'Laton'),
    ('Bateria', 'Siglo XIX', 'Anonimo', 'Percusion', 'Madera y metal'),
    ('Flauta', 'Prehistoria', 'Anonimo', 'Viento-madera', 'Madera'),
    ('Saxofon', 'Siglo XIX', 'Adolphe Sax', 'Viento-metal', 'Laton'),
    ('organo', 'Siglo III a.C.', 'Ctesibio de Alejandria', 'Teclado', 'Metal y madera'),
    ('Arpa', 'Siglo XVIII a.C.', 'Anonimo', 'Cuerda', 'Madera'),
    ('Tambor', 'Prehistoria', 'Anonimo', 'Percusion', 'Piel y madera');

INSERT INTO Obras_Famosas (Nombre, F_creacion, Genero)
VALUES
    ('Sonata para Piano No. 14', 1801, 'Clasica'),
    ('Bohemian Rhapsody', 1975, 'Rock'),
    ('Summertime', 1935, 'Jazz'),
    ('No Woman, No Cry', 1974, 'Reggae'),
    ('Thriller', 1982, 'Pop'),
    ('Ring of Fire', 1963, 'Country'),
    ('Respect', 1967, 'R&B'),
    ('Around the World', 1997, 'Electronica'),
    ('Concierto de Aranjuez', 1939, 'Clasica'),
    ('Celia y Tito', 1981, 'Salsa');

//1
SELECT G.Nombre AS Genero,G.Caracteristicas AS C_Genero,G.Origen,G.Instrumento, E.Nombre AS Epoca, E.A_inicio AS P_Inicio, M.Nombre AS Nombre_Musico, M.F_nacimiento AS F_Nacimiento_Musico
FROM Genero G
JOIN Epoca E ON G.Epoca = E.Nombre
LEFT JOIN Musico M ON G.Nombre = M.Genero;

//2
SELECT
