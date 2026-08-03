console.log("DAT250 SecureApp UI ready");

(function () {
  const currentPath = window.__CURRENT_PATH__ || "/";
  const links = document.querySelectorAll(".navbar .nav-link");
  links.forEach((link) => {
    const href = link.getAttribute("href");
    if (!href) return;
    if (href !== "/" && currentPath.startsWith(href)) {
      link.classList.add("active");
    } else if (href === currentPath) {
      link.classList.add("active");
    }
  });
})();
