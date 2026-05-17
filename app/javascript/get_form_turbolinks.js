import { visit } from "@hotwired/turbo";

document.addEventListener("turbo:load", function (event) {
  const forms = document.querySelectorAll("form[method=get]");
  for (const form of forms) {
    form.addEventListener("submit", function (event) {
      event.preventDefault();
      const formData = new FormData(form);
      const params = new URLSearchParams(formData);
      visit(`${form.action}?${params}`);
    });
  }
});
