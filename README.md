# Mujiki (無食)

A monorepo for all Mujiki codebases. Each codebase is included as a `git submodule`.

## Instructions

The instructions below assume `bash` on UNIX-like systems (Linux, macOS) and `cmd.exe` on Windows.

### Prerequisites

[JDK 21](https://www.oracle.com/au/java/technologies/downloads/#java21) is required for building the
project.

### Cloning

Make sure you pass the `--recursive` flag when cloning this repo to include all submodules.

```sh {"id":"01J98D2YSB41RXZYTZATC99TEW"}
git clone --recursive https://github.com/csci318-online-food/mujiki-ordering

```

### Building

For each microservice, the bundled Maven Wrapper (`mvnw`) needs to be invoked in order to install
dependencies and build the application.

```sh {"id":"01J98D2YSB41RXZYTZAV0AQ38N"}
cd $name-service
./mvnw install
cd ..

```

Or, on Windows:

```cmd {"id":"01J98D2YSB41RXZYTZAYD9YQW9"}
cd %name%-service
mvnw.cmd install
cd ..

```

(Replace `$name` or `%name%` with the name of each microservice).

### Running

Similarly, the `spring-boot:run` operation needs to be invoked for each microservice to run the
system.

```sh {"id":"01J98D2YSB41RXZYTZB14T3BSQ"}
cd $name-service
./mvnw spring-boot:run
cd ..

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1WF2Z495W"}
cd %name%-service
mvnw.cmd spring-boot:run
cd ..

```

Alternatively, building and running can be done in one command using the provided run scripts.

```sh {"id":"01J98D2YSCTGETY5A1WF3JDPNB"}
./run.sh

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1WFYX1VCS"}
run.cmd

```

The application should occupy HTTP ports `8080` - `8088`.

## Sample REST Requests

These are cURL commands runnable from the terminal to test the application's functionality.

Since UUIDs are randomly generated on each run, they will not match the sample requests shown below.
When testing, please **take note of the returned objects' UUIDs** (the `id` field) and substitute
those into subsequent requests.

A [Postman](https://www.postman.com/trungnt2910/mujiki/collection/pff869u/mujiki) collection
is also available. With support for automatic UUID extraction into environment variables, the tool
can make testing much more convenient.

When evaluating the application, it is recommended to run the commands in the order they are
presented.

Please refer to the report for a detailed explanation of each request parameter.

### Use Case 1 - Create User

```sh {"id":"01J98D2YSCTGETY5A1WH9MXTSY"}
curl -L 'http://localhost:8080/api/auth/user/signup' \
-H 'Content-Type: application/json' \
--data-raw '{
  "username":"nhi0412",
  "password": "password1",
  "firstName": "Nhi",
  "lastName": "Nguyen",
  "email": "nhin0412@gmail.com",
  "phone": "12345627890"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1WM164M3P"}
curl -L "http://localhost:8080/api/auth/user/signup" ^
-H "Content-Type: application/json" ^
--data-raw ^
"{^
  \"username\":\"nhi0412\",^
  \"password\": \"password1\",^
  \"firstName\": \"Nhi\",^
  \"lastName\": \"Nguyen\",^
  \"email\": \"nhin0412@gmail.com\",^
  \"phone\": \"12345627890\"^
}^
"

```

#### Use Case 1.1 - View Users

```sh {"id":"01J98D2YSCTGETY5A1WN4QPDVZ"}
curl -L "http://localhost:8081/api/user"

```

#### Use Case 1.2 - Find User by Username

```sh {"id":"01J98D2YSCTGETY5A1WNTZ6AJE"}
curl -L "http://localhost:8081/api/user/nhi0412"

```

### Use Case 2 - Create Restaurant

```sh {"id":"01J98D2YSCTGETY5A1WQA4DDFS"}
curl -L 'http://localhost:8080/api/auth/restaurant/signup' \
-H 'Content-Type: application/json' \
--data-raw '{
  "name": "Chat Thai",
  "phone": {
    "countryCode": "+61",
    "number": "1112223333"
  },
  "email": "chat.thai1@example.com",
  "password": "passchathai",
  "cuisine": "THAI",
  "openTime": "10:00:00",
  "closeTime": "22:00:00",
  "description": "Authentic Thai cuisine"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1WV6J4S7R"}
curl -L "http://localhost:8080/api/auth/restaurant/signup" ^
-H "Content-Type: application/json" ^
--data-raw ^
"{^
  \"name\": \"Chat Thai\",^
  \"phone\": {^
    \"countryCode\": \"+61\",^
    \"number\": \"1112223333\"^
  },^
  \"email\": \"chat.thai1@example.com\",^
  \"password\": \"passchathai\",^
  \"cuisine\": \"THAI\",^
  \"openTime\": \"10:00:00\",^
  \"closeTime\": \"22:00:00\",^
  \"description\": \"Authentic Thai cuisine\"^
}^
"

```

#### Use Case 2.1 - View Restaurants

```sh {"id":"01J98D2YSCTGETY5A1WW479Z3Q"}
curl -L "http://localhost:8082/api/restaurant"

```

#### Use Case 2.2 - Update Restaurant

```sh {"id":"01J98D2YSCTGETY5A1WYGHD5PY"}
curl -L -X PUT 'http://localhost:8082/api/restaurant/1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433' \
-H 'Content-Type: application/json' \
--data-raw '{
  "name": "Chat Thai V2 (new V2)",
  "phone": {
    "countryCode": "+61",
    "number": "1112223333"
  },
  "email": "chat.thai2@example.com",
  "password" : "pass",
  "cuisine": "THAI",
  "openTime": "10:00:00",
  "closeTime": "22:00:00",
  "description": "Authentic Thai cuisine"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1X26FHDQF"}
curl -L -X PUT "http://localhost:8082/api/restaurant/1f2faad0-5735-47a5-a0df-b11fde4a2395" ^
-H "Content-Type: application/json" ^
--data-raw ^
"{^
  \"name\": \"Chat Thai V2 (new V2)\",^
  \"phone\": {^
    \"countryCode\": \"+61\",^
    \"number\": \"1112223333\"^
  },^
  \"email\": \"chat.thai2@example.com\",^
  \"password\" : \"pass\",^
  \"cuisine\": \"THAI\",^
  \"openTime\": \"10:00:00\",^
  \"closeTime\": \"22:00:00\",^
  \"description\": \"Authentic Thai cuisine\"^
}^
"

```

### Use Case 3 - Create Address for User

```sh {"id":"01J98D2YSCTGETY5A1X5SRFWTD"}
curl -L 'http://localhost:8086/api/address/forUser/93242ebf-52dc-4f6a-8e52-7f31f1ad089e' \
-H 'Content-Type: application/json' \
-d '{
  "street": "68A Smith St",
  "suburb": "Wollongong",
  "state": "NSW",
  "postcode": 2500,
  "country": "Australia"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1X9FR1AQJ"}
curl -L "http://localhost:8086/api/address/forUser/93242ebf-52dc-4f6a-8e52-7f31f1ad089e" ^
-H "Content-Type: application/json" ^
-d ^
"{^
  \"street\": \"68A Smith St\",^
  \"suburb\": \"Wollongong\",^
  \"state\": \"NSW\",^
  \"postcode\": 2500,^
  \"country\": \"Australia\"^
}^
"

```

#### Use Case 3.1 - Find Address for User

```sh {"id":"01J98D2YSCTGETY5A1XBVWG1XH"}
curl -L "http://localhost:8086/api/address/forUser/93242ebf-52dc-4f6a-8e52-7f31f1ad089e"

```

### Use Case 4 - Create Address for Restaurant

```sh {"id":"01J98D2YSCTGETY5A1XBZTMQSP"}
curl -L 'http://localhost:8086/api/address/forRestaurant/1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433' \
-H 'Content-Type: application/json' \
-d '{
  "street": "91 Market St",
  "suburb": "Wollongong",
  "state": "NSW",
  "postcode": 2500,
  "country": "Australia"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSCTGETY5A1XCPGZQNE"}
curl -L "http://localhost:8086/api/address/forRestaurant/1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433" ^
-H "Content-Type: application/json" ^
-d ^
"{^
  \"street\": \"91 Market St\",^
  \"suburb\": \"Wollongong\",^
  \"state\": \"NSW\",^
  \"postcode\": 2500,^
  \"country\": \"Australia\"^
}^
"

```

#### Use Case 4.1 - Find Address for Restaurant

```sh {"id":"01J98D2YSCTGETY5A1XDWFTF2J"}
curl -L "http://localhost:8086/api/address/forRestaurant/1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433"

```

### Use Case 5 - Search for Restaurants

```sh {"id":"01J98D2YSCTGETY5A1XFD6DKPV"}
curl -L "http://localhost:8082/api/restaurant/search?cuisine=THAI&postcode=2500"

```

### Use Case 6 - Create Restaurant Items

```sh {"id":"01J98D2YSCTGETY5A1XK3CKZ07"}
curl -L 'http://localhost:8085/api/items/create?restaurantId=1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433' \
-H 'Content-Type: application/json' \
-d '{
  "name": "Fried Chicken with Mushroom Sauce",
  "description": "Fried chick with fresh mushroom collected from Aussie farm",
  "price": 12.99,
  "availability": true
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSD54K8AZ8XJW66Q9XH"}
curl -L "http://localhost:8085/api/items/create?restaurantId=1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433" ^
-H "Content-Type: application/json" ^
-d ^
"{^
  \"name\": \"Fried Chicken with Mushroom Sauce\",^
  \"description\": \"Fried chick with fresh mushroom collected from Aussie farm\",^
  \"price\": 12.99,^
  \"availability\": true^
}^
"

```

### Use Case 7 - Create Feedback for Restaurant

```sh {"id":"01J98D2YSECFE4BZ9PSC19Q3E5"}
curl -L 'http://localhost:8084/api/feedback/create' \
-H 'Content-Type: application/json' \
-d '{
  "restaurantId": "1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433",
  "userId": "93242ebf-52dc-4f6a-8e52-7f31f1ad089e",
  "rating": 1,
  "comments": "This is good"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSECFE4BZ9PSDHPPHQW"}
curl -L "http://localhost:8084/api/feedback/create" ^
-H "Content-Type: application/json" ^
-d ^
"{^
  \"restaurantId\": \"1d2f4e73-47c6-4aeb-92ae-4d0fbdb6b433\",^
  \"userId\": \"93242ebf-52dc-4f6a-8e52-7f31f1ad089e\",^
  \"rating\": 1,^
  \"comments\": \"This is good\"^
}^
"

```

### Use Case 8 - Add Payment Method

```sh {"id":"01J98D2YSECFE4BZ9PSH26Z0F7"}
curl -L 'http://localhost:8087/api/payment' \
-H 'Content-Type: application/json' \
-d '{
  "userId": "93242ebf-52dc-4f6a-8e52-7f31f1ad089e",
  "holderName" : "Nguyen Thanh Trung",
  "cardNumber" : "42424-2424-2424-2424"
}
'

```

Or, on Windows:

```sh {"id":"01J98D2YSECFE4BZ9PSMC6X6FF"}
curl -L "http://localhost:8087/api/payment" ^
-H "Content-Type: application/json" ^
-d ^
"{^
  \"userId\": \"93242ebf-52dc-4f6a-8e52-7f31f1ad089e\",^
  \"holderName\" : \"Nguyen Thanh Trung\",^
  \"cardNumber\" : \"42424-2424-2424-2424\"^
}^
"

```

#### Use Case 8.1 - View Payment Methods

```sh {"id":"01J98D2YSECFE4BZ9PSQ1GWTBQ"}
curl -L "http://localhost:8087/api/payment/user/93242ebf-52dc-4f6a-8e52-7f31f1ad089e"

```

### Use Case 9 - Add Item to Cart

This use case requires the following to be run first to get a `cartId`.

#### Use Case 9.0 - Create Cart for User

```sh {"id":"01J98D2YSECFE4BZ9PSRE1E8XW"}
curl -L 'http://localhost:8083/api/cart' \
-H 'Content-Type: application/json' \
-d '{
    "userId": "93242ebf-52dc-4f6a-8e52-7f31f1ad089e"
}
'

```

Or, on Windows:

```cmd {"id":"01J98D2YSECFE4BZ9PST66RZKS"}
curl -L "http://localhost:8083/api/cart" ^
-H "Content-Type: application/json" ^
-d ^
"{^
    \"userId\": \"93242ebf-52dc-4f6a-8e52-7f31f1ad089e\"^
}^
"

```

#### Use Case 9

```sh {"id":"01J98D2YSECFE4BZ9PSX9P4Y77"}
curl -L 'http://localhost:8083/api/cart/a0e8878d-1d29-443c-a99d-6222eff82f45/items' \
-H 'Content-Type: application/json' \
-d '{
    "restaurantId": "a0e8878d-1d29-443c-a99d-6222eff82f45",
    "itemId" : "a65ce87e-966d-41cf-b665-f7058e0540ef"
}'

```

Or, on Windows:

```cmd {"id":"01J98D2YSECFE4BZ9PT1264JW1"}
curl -L "http://localhost:8083/api/cart/a0e8878d-1d29-443c-a99d-6222eff82f45/items" ^
-H "Content-Type: application/json" ^
-d ^
"{^
    \"restaurantId\": \"a0e8878d-1d29-443c-a99d-6222eff82f45\",^
    \"itemId\" : \"a65ce87e-966d-41cf-b665-f7058e0540ef\"^
}"

```

### Use Case 10 - Pay for Cart

```sh {"id":"01J98D2YSECFE4BZ9PT2HAJK1G"}
curl -L -X POST "http://localhost:8083/api/cart/process-order/a0e8878d-1d29-443c-a99d-6222eff82f45?paymentId=fd039734-6b27-409d-b0aa-1de2d1bf59c2"

```
