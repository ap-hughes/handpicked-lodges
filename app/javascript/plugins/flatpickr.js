import flatpickr from 'flatpickr'
import 'flatpickr/dist/themes/airbnb.css'
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".start-date-picker", {
  altInput: true,
  // "plugins": [new rangePlugin({ input: "#end_date"})],
  dateFormat: "Y-m-d",
  minDate: "today",
  "locale": {
      "firstDayOfWeek": 7 // start week on Monday
  },
});
flatpickr(".end-date-picker", {
  altInput: true,
  // "plugins": [new rangePlugin({ input: "#end_date"})],
  dateFormat: "Y-m-d",
  minDate: "today",
  "locale": {
      "firstDayOfWeek": 7 // start week on Monday
  },
});
