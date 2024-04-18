import ballerina/http;
import ballerina/log;

configurable string service_url = ?;
configurable string consumer_key = ?;
configurable string consumer_secret = ?;
configurable string token_url = ?;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get movies() returns Movie[]|error {

        log:printInfo("Get movie external hit");

        http:Client c = check new (service_url,
            auth = {
                tokenUrl: token_url,
                clientId: consumer_key,
                clientSecret: consumer_secret
            }
        );

        json response = check c->get("/movies");

        log:printInfo(response.toBalString());

        return [];

    }
}
