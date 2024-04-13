DROP DATABASE MovieTicketingSystem;

CREATE DATABASE IF NOT EXISTS MovieTicketingSystem;

USE MovieTicketingSystem;

CREATE TABLE IF NOT EXISTS Movie (
    id varchar(255),
    title varchar(255),
    description varchar(1000),
    image varchar(255),
    genre varchar(255),
    trailer varchar(255),
    active boolean,
    releaseDate varchar(255),
    duration int,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Location (
    id varchar(255),
    name varchar(255),
    address varchar(255),
    active boolean,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Theatre (
    id varchar(255),
    name varchar(255),
    description varchar(1000),
    location varchar(255),
    active boolean,
    totalSeats int,
    remainingSeats int,
    PRIMARY KEY (id),
    FOREIGN KEY (location) REFERENCES Location(id)
);
CREATE TABLE IF NOT EXISTS ShowTime (
    id varchar(255),
    movie varchar(255),
    theatre varchar(255),
    startTime varchar(255),
    endTime varchar(255),
    language varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (movie) REFERENCES Movie(id),
    FOREIGN KEY (theatre) REFERENCES Theatre(id)
);
CREATE TABLE IF NOT EXISTS User (
    id varchar(255),
    email varchar(255),
    name varchar(255),
    phone varchar(255),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Ticket (
    id varchar(255),
    user varchar(255),
    date varchar(255),
    showTime varchar(255),
    seats varchar(255),
    amount float,
    paymentConfirmation varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user) REFERENCES User(id),
    FOREIGN KEY (showTime) REFERENCES ShowTime(id)
);

INSERT INTO Movie VALUES ( '001', 'Civil War', 'In a dystopian future America, a team of military-embedded journalists races against time to reach Washington, D.C., before rebel factions descend upon the White House.', '', 'Action', 'https://www.youtube.com/watch?v=c2G18nIVpNE', true, '04/12/2024', 109);
INSERT INTO Movie VALUES ( '002', 'Godzilla x Kong: The New Empire', 'The epic battle continues! Legendary Pictures’ cinematic Monsterverse follows up the explosive showdown of “Godzilla vs. Kong” with an all‐new adventure that pits the almighty Kong and the fearsome Godzilla against a colossal undiscovered threat hidden within our world, challenging their very existence—and our own. “Godzilla x Kong: The New Empire” delves further into the histories of these Titans and their origins, as well as the mysteries of Skull Island and beyond, while uncovering the mythic battle that helped forge these extraordinary beings and tied them to humankind forever.',
    '', 'Action', 'https://www.youtube.com/watch?v=qqrpMRDuPfc', true, '03/29/2024', 115);
