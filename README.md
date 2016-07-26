# TRELORA Appoinments

A team project by:

[Thom Schlereth](github.com/thompickett)
[Chad Ellison](github.com/chadellison)

## Description

Takes in scheduled appointments through Google’s calendar api and then displays them on a map using Google’s maps api. The appointments are sorted by time and employee so that a new appointment can be scheduled easily.

[Production](trelora-appointments.herokuapp.com)

If you want to to use this application

- clone `https://github.com/chadellison/trelora_appointments.git`

- You'll need to get a google client service account. You can access it here ``

- If you are using sub-calendars within your calendar you'll need to go to `app/services/google_calendar_service.rb` and edit it to pull in events from the correct calendars. You'll will need to know the correct calendar-id to do this.

- You will also need to set the following ENVIRONMENT VARIABLES  
 - [GOOGLE_API_KEY](https://console.developers.google.com/projectselector/apis/credentials)  
 - GOOGLE_APPLICATION_CREDENTIALS needs to be set to `./client_secrets.json`  
  - You'll need to set up a client_secrets file that contains the google client service account information as a JSON object.
 - [TRELORA_API_KEY] Talk to TRELORA  
 - [TRELORA_APPOINTMENTS_DATABASE_PASSWORD] Talk to TRELORA  
