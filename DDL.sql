DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS billing;
DROP TABLE IF EXISTS administrativestaff;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS members;


CREATE TABLE members (
    member_id SERIAL PRIMARY KEY, -- this is our membership id 
    email VARCHAR(255)  NOT NULL UNIQUE,
    password TEXT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    health_metrics TEXT,
    fitness_goals TEXT
);

CREATE TABLE dashboard(
-- what is the difference from health metrics, fitness goals and health statistic/fitness achivements
-- is it referencing to the members table?
    member_id int PRIMARY KEY,
    exercise_routines TEXT,
    fitness_goals TEXT,
    health_metrics TEXT,
    FOREIGN KEY(member_id) REFERENCES members
);

CREATE TABLE administrativestaff (
    staff_id SERIAL PRIMARY KEY,
    email VARCHAR(255)  NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE billing (
    member_id SERIAL PRIMARY KEY,
    amount INT,
    due_date DATE,
    paid BOOLEAN,
    FOREIGN KEY(member_id) REFERENCES members,
);

CREATE TABLE equipment(
    equipment_id SERIAL PRIMARY KEY,
    booked_date DATE,
    booked_time TIME,
    member_id INT,
    FOREIGN KEY(member_id) REFERENCES members
);

CREATE TABLE room(
    room_id SERIAL PRIMARY KEY,
    room_location VARCHAR(255) NOT NULL,
    event_type VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    start_time TIME,
    end_time TIME
);

CREATE TABlE trainers(
    trainer_id SERIAL PRIMARY KEY,
    email VARCHAR(255)  NOT NULL UNIQUE,
    password TEXT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    schedule TEXT --CHANGE????, how do we want to setup how the schedule looks? another table since multivalued?
);

CREATE TABLE personalsessions(
    session_id SERIAL PRIMARY KEY,
    member_id INT NOT NULL,
    trainer_id INT NOT NULL,
    booked_date DATE,
    booked_time TIME,
    FOREIGN KEY(member_id) REFERENCES members,
    FOREIGN KEY(trainer_id) REFERENCES trainers
);

CREATE TABLE groupsessions(
    session_id SERIAL PRIMARY KEY,
    trainer_id INT NOT NULL,
    booked_date DATE,
    booked_time TIME,
    room_id INT NOT NULL, -- should this be a foreign key to room table or the other way around?
    FOREIGN KEY(trainer_id) REFERENCES trainers
);
ALTER TABLE groupsessions -- makes sure that the groupsessions room_id matches to a room room_id? do we want this? adding a constraint?
ADD CONSTRAINT fk_room_id
FOREIGN KEY (room_id) REFERENCES room(room_id);
CREATE TABLE sessionmembers(
    session_id INT,
    member_id INT,
    PRIMARY KEY (session_id, member_id),
    FOREIGN KEY (session_id) REFERENCES groupsessions(session_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
