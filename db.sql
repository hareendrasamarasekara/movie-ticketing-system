DROP DATABASE MovieTicketingSystem;

CREATE DATABASE IF NOT EXISTS MovieTicketingSystem;

USE MovieTicketingSystem;

CREATE TABLE IF NOT EXISTS Movie (
    id varchar(255),
    title varchar(255),
    description varchar(1000),
    imageUrl varchar(255),
    genre varchar(255),
    trailerUrl varchar(255),
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

INSERT INTO Movie VALUES ( '001', 'Civil War', 'In a dystopian future America, a team of military-embedded journalists races against time to reach Washington, D.C., before rebel factions descend upon the White House.', 'https://www.cinemark.com/media/2myfnthx/lg-new-cw-poster.jpg', 'Action', 'https://www.youtube.com/watch?v=c2G18nIVpNE', true, '04/12/2024', 109);
INSERT INTO Movie VALUES ( '002', 'Godzilla x Kong: The New Empire', 'The epic battle continues! Legendary Pictures’ cinematic Monsterverse follows up the explosive showdown of “Godzilla vs. Kong” with an all‐new adventure that pits the almighty Kong and the fearsome Godzilla against a colossal undiscovered threat hidden within our world, challenging their very existence—and our own. “Godzilla x Kong: The New Empire” delves further into the histories of these Titans and their origins, as well as the mysteries of Skull Island and beyond, while uncovering the mythic battle that helped forge these extraordinary beings and tied them to humankind forever.',
    'https://www.cinemark.com/media/eogd40rl/lg-godzilla-xke-final-poster.jpg', 'Action', 'https://www.youtube.com/watch?v=qqrpMRDuPfc', true, '03/29/2024', 115);
INSERT INTO Movie VALUES ( '003', 'Abigail', 'Six criminals capture ballet dancer Abigail, the daughter of a powerful underworld figure within New York City, and bring her to a secluded mansion upstate. The group, led by informant Lambert, is told not to disclose any personal information amongst themselves or to Abigail.', 'https://www.cinemark.com/media/aisex4g2/lg-abigail-poster.jpg', 'Horror, Thriller', 'https://www.youtube.com/watch?v=xtAL2x58hns', true, '04/19/2024', 109);
INSERT INTO Movie VALUES ( '004', 'Ghostbusters: Frozen Empire', 'In Ghostbusters: Frozen Empire, the Spengler family returns to where it all started – the iconic New York City firehouse – to team up with the original Ghostbusters, who’ve developed a top-secret research lab to take busting ghosts to the next level. But when the discovery of an ancient artifact unleashes an army of ghosts that casts a death chill upon the city, Ghostbusters new and old must join forces to protect their home and save the world from a second Ice Age.', 'https://www.cinemark.com/media/ynoi0pe3/lg-gbfe-ft-poster.jpg', 'Adventure, Mystery, Comedy', 'https://www.youtube.com/watch?v=k_6CbpF2FSk', true, '03/22/2024', 115);
INSERT INTO Movie VALUES ( '005', 'The Ministry of Ungentlemanly Warfare', 'From the director of Sherlock Holmes and the producer of Top Gun: Maverick. A film by Guy Ritchie.', 'https://www.cinemark.com/media/rrcejfqm/lg-mougw-new-poster.jpg', 'Action, Comedy', 'https://www.youtube.com/watch?v=zvwDen1Wrx8', true, '04/19/2024', 120);