import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#typed-text', {
    strings: ["beach", "surfing", "fishing", "food", "music"],
    typeSpeed: 135,
    loop: true
  });
}

export { loadDynamicBannerText };
