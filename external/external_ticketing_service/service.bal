import ballerina/http;
import ballerina/log;
import ballerina/os;

// configurable string service_url = os:getEnv("SERVICE_URL");
// configurable string consumer_key = os:getEnv("CONSUMER_KEY");
// configurable string consumer_secret = os:getEnv("CONSUMER_SECRET");
// configurable string token_url = os:getEnv("TOKEN_URL");
string service_url = os:getEnv("SERVICE_URL");
string consumer_key = os:getEnv("CONSUMER_KEY");
string consumer_secret = os:getEnv("CONSUMER_SECRET");
string token_url = os:getEnv("TOKEN_URL");

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get movies() returns Movie[]|error {

        log:printInfo("Get movie external hit...");
        log:printInfo("token_url = " + token_url);
        log:printInfo("consumer_key = " + consumer_key);
        log:printInfo("consumer_secret = " + consumer_secret);
        log:printInfo("service_url = " + service_url);
        log:printInfo("=======================================");

        string access_token = check getAccessToken() ?: "";

        if (access_token != "") {
            http:Client c = check new (service_url,
                auth = {
                    token: access_token
                }
            );

            json response = check c->get("/movie");

            log:printInfo(response.toBalString());

            // Movie[] movies = check response.cloneWithType(Movie[]);
        } else {
            log:printError("Could not retrive access token!");
        }
        
        return [];
    }
}

function getAccessToken() returns string|error? {

    log:printInfo("Retriving access token...");

    http:Client c = check new(token_url,
        auth = {
            username: consumer_key,
            password: consumer_secret
        }
    );

    json response = check c->/.post({
        grant_type: "client_credentials"
    });

    log:printInfo(response.toBalString());
    string access_token = check response.access_token;

    return access_token;
}
