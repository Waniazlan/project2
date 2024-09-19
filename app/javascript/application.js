// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "popper";
import "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
  const menuButton = document.querySelector("button");
  const mobileMenu = document.querySelector(".md:hidden.flex.flex-col");

  menuButton.addEventListener("click", () => {
    mobileMenu.classList.toggle("hidden");
  });
});
import "@hotwired/turbo-rails";
