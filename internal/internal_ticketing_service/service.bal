import ballerina/http;
import ballerina/log;
import ballerinax/mysql;
import ballerina/sql;
import ballerinax/mysql.driver as _;

configurable string db_host = ?;
configurable int db_port = ?;
configurable string db_user = ?;
configurable string db_password = ?;
configurable string db_database = ?;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    private final mysql:Client db;

    function init() returns error? {
        self.db = check new (db_host, db_user, db_password, db_database, db_port);
    }
    resource function get movies() returns Movie[]|error {

        log:printInfo("Get movie hit");

        stream<Movie, sql:Error?> movieStream = self.db->query(`SELECT * FROM Movie`);
        return from Movie movie in movieStream select movie;

    }
}
