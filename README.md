# event_countdown
This is the first project I did in my attempt to start learning flutter by building.
Reference is made to [an article written by Florin Pop](https://blog.bitsrc.io/15-app-ideas-to-build-and-level-up-your-coding-skills-28612c72a3b1) for the ideas


## Getting Started

The objective of the event_countdown is to provide a continuously decrementing display of the months, days, hours, minutes, and seconds to a user entered event.



# User Stories
- User can see an event input box containing an event name field, an date field, an optional time, and a ‘Start’ button.
- User can define the event by entering its name, the date it is scheduled to take place, and an optional time of the event. If the time is omitted it is assumed to be at Midnight on the event date in the local time zone.
- User can see a warning message if the event name is blank.
- User can see a warning message if the event date or time are incorrectly entered.
- User can see a warning message if the time until the event data and time that has been entered would overflow the precision of the countdown timer.
- User can click on the ‘Start’ button to see the countdown timer start displaying the days, hours, minutes, and seconds until the event takes place.
- User can see the elements in the countdown timer automatically decrement. For example, when the remaining seconds count reaches 0 the remaining minutes count will decrement by 1 and the seconds will start to countdown from 59. This progression must take place from seconds all the way up to the remaining days position in countdown display.

![event_countdown UI](https://user-images.githubusercontent.com/70073642/153404579-d226a08f-b1f4-4c14-9634-17d1fd6957ae.png)

![event_countdown](https://user-images.githubusercontent.com/70073642/153404591-6f297dd3-831b-4f4e-b7a4-97f7130ca454.png)
