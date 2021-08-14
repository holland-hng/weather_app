# weather_app

## VIDEO DEMO
![IMAGE ALT TEXT](http://img.youtube.com/vi/Srd-Q6o6KOs/0.jpg)(http://www.youtube.com/watch?v=Srd-Q6o6KOs "Weather app")

## SPEC
 
    ✅  Get weather data from API.
    ✅  Spec about the calendar:
        ✅  Show Today at the beginning of the week (index = 0) and next 6 days.
        ✅  Initially, today is highlighted by gradient color. When users select another day, that
            day is highlighted instead.
        ✅  Users could swipe the calendar left or right to view weather data of the last week or
            next week. We only show one next week and one last week.
        ✅  When users swipe to next week or last week, the current index of the highlighted day
    ✅  Display Weather State icon
        ✅  Depending on the Weather States table, you can display the weather icon
            corresponding to Abbreviation value (weather_state_abbr) from API response.
        ✅  Find the most common number of weather_state_abbr values in ArrayJSON API
            response to display on UI
    ✅  Display Temperature
    ✅  Display Weather State name
    ✅  Display Date:
    ✅  Display predictability
    ✅  When users pull to refresh, we call API to reload weather data of the current date.
    ✅  When users get an error, show the snackbar
    ✅  When data is empty, we display the Text: “No Data” in the center.
    ⬜️  Animation
        ⬜️  Whether icon: fade + slide down transition.
        ✅  Humidity & predictability progress bar is animated from 0% to the current progress.
        ✅  Humidity & predictability & the_temp value is animated from 0 to current value.
    
## TECHNICAL REQUIREMENT
    ✅  Use Flutter version 2+.
    ✅  Build responsive UI across all devices.
    ✅  The app could be used offline or online. Store data to Database to use the app offline.
    ✅  Use the best architecture and State management that you are confident in (as clean as
        possible).
    ✅  Use GIT and GIT Flow to manage your code

## BONUS POINT
    ✅  Unit test.
    ✅  Use Bloc + Rx for State management.
    ✅  Use Dio for network calls.
    ✅  Use clean architecture.
    ✅  Not use third party library for custom views
    ⬜️  Design and implement creative animations like moving clouds, rotating sun
