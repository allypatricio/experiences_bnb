import flatpickr from 'flatpickr';

const initDatepickers = function() {
  const dateTimeInput = document.getElementById('booking_date_time');

  if (dateTimeInput) {
    flatpickr(dateTimeInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y H:i',
    enableTime: true,
    time_24hr: true,
    altInput: true,
    defaultDate: new Date(),
    });
  };
};

export default initDatepickers;
