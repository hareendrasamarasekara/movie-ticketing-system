import ballerina/http;
import ballerina/log;
import ballerinax/mysql;
import ballerina/sql;
import ballerinax/mysql.driver as _;

configurable string db_host = ?;
configurable int db_port = ?;
configurable string db_user = ?;
configurable string db_password = ?;
configurable string db_database = "MovieTicketingSystem";

@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"],
        allowCredentials: false,
        allowHeaders: ["CORELATION_ID"],
        exposeHeaders: ["X-CUSTOM-HEADER"],
        maxAge: 84900
    }
}
service / on new http:Listener(9090) {

    private final mysql:Client db;

    function init() returns error? {
        self.db = check new (db_host, db_user, db_password, db_database, db_port);
    }
    resource function get movie() returns Movie[]|error {

        log:printInfo("Get movie hit");

        stream<Movie, sql:Error?> movieStream = self.db->query(`SELECT * FROM Movie`);
        return from Movie movie in movieStream select movie;

    }

    resource function get movie/[int id]() returns Movie|error {

        log:printInfo("Get movie by ID hit");

        Movie movie = check self.db->queryRow(`SELECT * FROM Movie WHERE Movie.id=${id}`);
        return movie;
    }
}
