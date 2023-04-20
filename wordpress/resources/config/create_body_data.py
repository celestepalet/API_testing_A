from wordpress.resources.config.generate_names import GenerateNames

false = False
first_name = GenerateNames().generate_random_name()
last_name = GenerateNames().generate_random_last_name()
email = first_name + "_" + last_name + "@apitesting.com"
email = email.lower()

create_body = {
    "attributes": {
        "FIRSTNAME": first_name,
        "LASTNAME": last_name
    },
    "listIds": [
            14
    ],
    "updateEnabled": false,
    "email": email,
    "ext_id": "10240",
    "emailBlacklisted": false,
    "smsBlacklisted": false
}

change_data = {
    "attributes": {
        "FIRSTNAME": "Fabio",
        "LASTNAME": "Gomez"
    }
}
