import wso2/choreo.sendemail;
import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

configurable string host = ?;
configurable int port = ?;
configurable string user = ?;
configurable string password = ?;
configurable string database = "MovieTicketingSystem";
configurable string email = ?;
const emailSubject = "Movie Ticket Statistics";

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

// Create a new email client
sendemail:Client emailClient = check new ();

public function main() returns error? {

    final mysql:Client db;
    db = check new (host, user, password, database, port);

    Movie[] movies = check getMovies(db);
    io:println(movies);

    string movieList = "";
    foreach Movie movie in movies {
        movieList = movieList + "   - " + movie.title + "\n";
    }

    string finalContent = string `
Hello,

Please find the active list of movies below.

${movieList}

Warm regards,
The Movie Ticketing Team

---
`;
    // Send the email
    string _ = check emailClient->sendEmail(email, emailSubject, finalContent);
    io:println("Successfully sent the email.");
}

function getMovies(mysql:Client db) returns Movie[]|error {

    stream<Movie, sql:Error?> movieStream = db->query(`SELECT * FROM Movie`);
    return from Movie movie in movieStream select movie;
}
