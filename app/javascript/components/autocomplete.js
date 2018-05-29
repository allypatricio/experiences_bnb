// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var experienceAddress = document.getElementById('experience_address');

    if (experienceAddress) {
      var autocomplete = new google.maps.places.Autocomplete(experienceAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(experienceAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
