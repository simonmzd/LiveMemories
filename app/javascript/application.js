// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById("search-input");
  const clearSearch = document.getElementById("clear-search");
  const searchForm = document.getElementById("search-form");

  if (searchInput && clearSearch && searchForm) {
    const toggleClearButton = () => {
      clearSearch.style.display = searchInput.value.length > 0 ? "block" : "none";
    };

    toggleClearButton();

    searchInput.addEventListener("input", toggleClearButton);

    searchInput.addEventListener("keydown", (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        searchForm.submit();
      }
    });

    clearSearch.addEventListener("click", () => {
      searchInput.value = "";
      toggleClearButton();
      window.location.href = "/concerts";
    });

    searchForm.addEventListener("submit", (event) => {
      console.log("Form submit event triggered", event);
      setTimeout(toggleClearButton, 0);
    });
  }
});
