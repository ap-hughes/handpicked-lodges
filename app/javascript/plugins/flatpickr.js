import flatpickr from 'flatpickr'
import 'flatpickr/dist/themes/airbnb.css'
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".start-date-picker", {
  altInput: true,
  // "plugins": [new rangePlugin({ input: "#end_date"})],
  dateFormat: "Y-m-d",
  minDate: "today",
  disableMobile: "true",
  "enable": [
      function(date) {
          // return true to disable
          return ( date.getDay() === 1 || date.getDay() === 5 );

      }
  ],
  "locale": {
      "firstDayOfWeek": 5 // start week on Friday
  },
});
// flatpickr(".end-date-picker", {
//   altInput: true,
//   // "plugins": [new rangePlugin({ input: "#end_date"})],
//   dateFormat: "Y-m-d",
//   minDate: "today",
//   "locale": {
//       "firstDayOfWeek": 5 // start week on Friday
//   },
// });
