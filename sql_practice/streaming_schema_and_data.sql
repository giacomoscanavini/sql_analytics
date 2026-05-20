BEGIN TRANSACTION;
CREATE TABLE artists (
        artist_id INTEGER PRIMARY KEY,
        artist_name TEXT NOT NULL,
        country TEXT
    );
INSERT INTO "artists" VALUES(1,'The Indexes','UK');
INSERT INTO "artists" VALUES(2,'Null Island','USA');
INSERT INTO "artists" VALUES(3,'Tokyo Joins','Japan');
INSERT INTO "artists" VALUES(4,'Foreign Keys','Italy');
INSERT INTO "artists" VALUES(5,'The Aggregates','Germany');
INSERT INTO "artists" VALUES(6,'Cartesian Product','Canada');
INSERT INTO "artists" VALUES(7,'Recursive CTE','France');
INSERT INTO "artists" VALUES(8,'Query Plan',NULL);
INSERT INTO "artists" VALUES(9,'Dead Index','Norway');
INSERT INTO "artists" VALUES(10,'Vacuum Crew','Spain');
CREATE TABLE plays (
        play_id INTEGER PRIMARY KEY,
        user_id INTEGER NOT NULL,
        track_id INTEGER NOT NULL,
        played_at TEXT NOT NULL,
        seconds_played INTEGER NOT NULL CHECK (seconds_played >= 0),
        device TEXT,
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (track_id) REFERENCES tracks(track_id)
    );
INSERT INTO "plays" VALUES(1,1,3,'2025-05-01 08:00:00',240,'mobile');
INSERT INTO "plays" VALUES(2,1,5,'2025-05-01 08:06:00',300,'mobile');
INSERT INTO "plays" VALUES(3,2,1,'2025-05-01 09:10:00',190,'web');
INSERT INTO "plays" VALUES(4,2,2,'2025-05-02 10:00:00',185,'web');
INSERT INTO "plays" VALUES(5,3,4,'2025-05-02 18:20:00',260,'desktop');
INSERT INTO "plays" VALUES(6,3,8,'2025-05-03 19:00:00',120,'desktop');
INSERT INTO "plays" VALUES(7,4,3,'2025-05-03 20:30:00',200,'mobile');
INSERT INTO "plays" VALUES(8,4,6,'2025-05-04 21:00:00',275,'mobile');
INSERT INTO "plays" VALUES(9,5,5,'2025-05-05 07:45:00',300,'web');
INSERT INTO "plays" VALUES(10,5,6,'2025-05-05 08:00:00',240,'web');
INSERT INTO "plays" VALUES(11,6,1,'2025-05-06 13:10:00',60,'mobile');
INSERT INTO "plays" VALUES(12,6,7,'2025-05-06 13:15:00',230,'mobile');
INSERT INTO "plays" VALUES(13,1,7,'2025-05-07 08:00:00',230,'mobile');
INSERT INTO "plays" VALUES(14,2,3,'2025-05-07 09:30:00',240,'web');
INSERT INTO "plays" VALUES(15,3,5,'2025-05-08 18:00:00',300,'desktop');
INSERT INTO "plays" VALUES(16,4,2,'2025-05-08 20:10:00',90,'mobile');
INSERT INTO "plays" VALUES(17,7,9,'2025-05-09 09:00:00',180,'desktop');
INSERT INTO "plays" VALUES(18,7,10,'2025-05-09 09:05:00',420,'desktop');
INSERT INTO "plays" VALUES(19,8,11,'2025-05-10 10:00:00',200,'web');
INSERT INTO "plays" VALUES(20,8,12,'2025-05-10 10:04:00',210,'web');
INSERT INTO "plays" VALUES(21,9,15,'2025-05-11 11:00:00',0,'mobile');
INSERT INTO "plays" VALUES(22,10,14,'2025-05-11 12:00:00',185,NULL);
INSERT INTO "plays" VALUES(23,11,16,'2025-05-12 13:00:00',305,'desktop');
INSERT INTO "plays" VALUES(24,1,10,'2025-05-13 08:00:00',420,'mobile');
INSERT INTO "plays" VALUES(25,2,11,'2025-05-13 09:00:00',100,'web');
INSERT INTO "plays" VALUES(26,3,9,'2025-05-13 18:00:00',180,'desktop');
INSERT INTO "plays" VALUES(27,4,12,'2025-05-14 19:00:00',210,'mobile');
INSERT INTO "plays" VALUES(28,5,14,'2025-05-14 20:00:00',185,'web');
INSERT INTO "plays" VALUES(29,6,15,'2025-05-15 21:00:00',190,'mobile');
INSERT INTO "plays" VALUES(30,7,16,'2025-05-16 09:00:00',305,'desktop');
INSERT INTO "plays" VALUES(31,8,5,'2025-05-16 10:00:00',300,'web');
INSERT INTO "plays" VALUES(32,10,3,'2025-05-17 12:00:00',240,'mobile');
INSERT INTO "plays" VALUES(33,1,11,'2025-05-18 08:00:00',50,'mobile');
INSERT INTO "plays" VALUES(34,2,10,'2025-05-18 09:00:00',420,'web');
CREATE TABLE tracks (
        track_id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        artist_id INTEGER NOT NULL,
        genre TEXT NOT NULL,
        duration_seconds INTEGER NOT NULL CHECK (duration_seconds > 0),
        release_year INTEGER NOT NULL,
        explicit INTEGER NOT NULL DEFAULT 0 CHECK (explicit IN (0, 1)),
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
    );
INSERT INTO "tracks" VALUES(1,'Select Star',1,'Rock',210,2024,0);
INSERT INTO "tracks" VALUES(2,'Where Are You',2,'Pop',185,2023,0);
INSERT INTO "tracks" VALUES(3,'Inner Join',3,'Electronic',240,2025,0);
INSERT INTO "tracks" VALUES(4,'Primary Love',4,'Jazz',260,2022,0);
INSERT INTO "tracks" VALUES(5,'Group By Night',5,'House',300,2024,0);
INSERT INTO "tracks" VALUES(6,'Having Fun',5,'House',275,2025,0);
INSERT INTO "tracks" VALUES(7,'Order By Sunrise',1,'Rock',230,2025,0);
INSERT INTO "tracks" VALUES(8,'Left Join Blues',4,'Jazz',245,2023,0);
INSERT INTO "tracks" VALUES(9,'Cross Join Chaos',6,'Electronic',180,2025,1);
INSERT INTO "tracks" VALUES(10,'Recursive Dreams',7,'Ambient',420,2024,0);
INSERT INTO "tracks" VALUES(11,'Explain Analyze',8,'Hip-Hop',200,2025,1);
INSERT INTO "tracks" VALUES(12,'Index Scan',1,'Rock',210,2021,0);
INSERT INTO "tracks" VALUES(13,'Silent Track',9,'Ambient',60,2025,0);
INSERT INTO "tracks" VALUES(14,'Vacuum Full',10,'Pop',185,2025,0);
INSERT INTO "tracks" VALUES(15,'Null Beat',2,'Pop',190,2024,1);
INSERT INTO "tracks" VALUES(16,'Hash Aggregate',5,'House',305,2022,0);
CREATE TABLE users (
        user_id INTEGER PRIMARY KEY,
        username TEXT NOT NULL UNIQUE,
        country TEXT,
        plan TEXT NOT NULL CHECK (plan IN ('free', 'basic', 'premium')),
        joined_at TEXT NOT NULL,
        active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0, 1))
    );
INSERT INTO "users" VALUES(1,'sql_samurai','Japan','premium','2024-12-01',1);
INSERT INTO "users" VALUES(2,'data_dude','UK','basic','2025-01-02',1);
INSERT INTO "users" VALUES(3,'queryqueen','Italy','premium','2025-01-15',1);
INSERT INTO "users" VALUES(4,'join_master','Germany','free','2025-02-01',1);
INSERT INTO "users" VALUES(5,'cte_fan','Spain','basic','2025-02-20',1);
INSERT INTO "users" VALUES(6,'null_pointer','France','free','2025-03-11',1);
INSERT INTO "users" VALUES(7,'window_wizard','USA','premium','2025-03-20',1);
INSERT INTO "users" VALUES(8,'groupby_guru','India','basic','2025-03-25',1);
INSERT INTO "users" VALUES(9,'having_hero',NULL,'free','2025-04-01',1);
INSERT INTO "users" VALUES(10,'case_when','Canada','premium','2025-04-10',1);
INSERT INTO "users" VALUES(11,'schema_sage','Australia','basic','2025-04-15',0);
INSERT INTO "users" VALUES(12,'quiet_listener','Japan','free','2025-05-01',1);
COMMIT;
