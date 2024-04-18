import ballerina/log;
import ballerinax/mysql;
import ballerina/sql;
import ballerinax/mysql.driver as _;

import wso2/choreo.sendemail as ChoreoEmail;

configurable string db_host = ?;
configurable int db_port = ?;
configurable string db_user = ?;
configurable string db_password = ?;
configurable string db_database = "MovieTicketingSystem";
configurable string email = ?;

type Movie record {|
    string id;
    string title;
    string description;
    string image;
    string genre;
    string trailer;
    boolean active;
    string releaseDate;
    int duration; // in minutes
|};

public function main() returns error? {

    Movie[] movies = check getMovies();

    check sendEmail(movies);
}

function getMovies() returns Movie[]|error {

    log:printInfo("Getting all the movies.");

    mysql:Client db = check new (db_host, db_user, db_password, db_database, db_port);
    stream<Movie, sql:Error?> movieStream = db->query(`SELECT * FROM Movie`);
    return from Movie movie in movieStream select movie;
}

function sendEmail(Movie[] movies) returns error? {

    string movieList = "";
    foreach Movie movie in movies {
        movieList = movieList + "   - " + movie.title + "\n";
    }

    // Appending branding details to the content
    string finalContent = string `
Hello,

Please find the active list of movies below.

${movieList}

Warm regards,
The Movie Ticketing Team

---
`;

    ChoreoEmail:Client emailClient = check new ();
    string sendEmailResponse = check emailClient->sendEmail(email, "Ticketing System Stats", finalContent);
    log:printInfo("Email sent successfully to: " + email + " with response: " + sendEmailResponse);
}
