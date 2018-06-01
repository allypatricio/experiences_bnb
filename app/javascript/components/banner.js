import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#typed-text', {
    strings: ["sports", "food", "culture", "music", "sightseeing"],
    typeSpeed: 135,
    loop: true
  });
}

export { loadDynamicBannerText };
