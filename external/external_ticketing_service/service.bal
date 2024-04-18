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
        log:printInfo("token_url = " + token_url);
        log:printInfo("consumer_key = " + consumer_key);
        log:printInfo("consumer_secret = " + consumer_secret);
        log:printInfo("service_url = " + service_url);

        check getAccessToken();
        
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

function getAccessToken() returns error? {

    http:Client c = check new(token_url);

    json response = check c->/.post({
        grant_type: "client_credentials",
        clientId: consumer_key,
        clientSecret: consumer_secret
    });

    log:printInfo(response.toBalString());
}
