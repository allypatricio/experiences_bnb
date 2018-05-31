import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#typed-text', {
    strings: ["beach", "...", "surfing", "...", "fishing", "...", "food", "...", "music", "..."],
    typeSpeed: 150,
    loop: true
  });
}

export { loadDynamicBannerText };
