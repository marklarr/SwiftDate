Compare and create relative and absolute dates like you mean business.

```swift
let wwdcStartDate = 1.days.ago // Jun 2, 2014, 9:27 PM (at time of writing)
June/3 > wwdcStartDate // true
June/3/2013 > wwdcStartDate // false

1.days.ago > 23.hours.ago // false

1.hours.fromNow > 55.minutes.fromNow // true

June/2013 > January/2013 // true
```
