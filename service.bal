import ballerina/http;
import ballerina/io;
# 1. Create a new user;
# 2. View an existing user;
# 3. Update a ﬁeld in an existing user;
# 4. Delete an existing user.
#
# A user can be represented by her ﬁrst and last names, her email address and proﬁle. The identiﬁer attached to a user should be returned after creation.
# Note that you are expected to create a git repository for your package.

# A service representing a network-accessible API
# bound to absolute path `/hello` and port `9090`.

type User record {|
    readonly string first_name;
    string last_name;
    string email;
    Profile profile;
    string? id;
|};
type Profile record {|
    int age;
    float height;
    float weight;
|};

service /hello on new http:Listener(9090) {

    # A resource respresenting an invokable API method
    # accessible at `/hello/sayHello`.
    #
    # + caller - the client invoking this resource
    # + request - the inbound request
    resource function get sayHello(http:Caller caller, http:Request request) {

        // Send a response back to the caller.
        error? result = caller->respond("Hello Ballerina!");
        if (result is error) {
            io:println("Error in responding: ", result);
        }
    }
}
