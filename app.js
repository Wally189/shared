(function () {
  var root = document.documentElement;
  var storageKey = "repos-templates-theme";
  var themes = [
    "waylight-lavender-calm",
    "deep-navy-warm-stone",
    "forest-linen",
    "oxford-blue-mist",
    "burgundy-parchment",
    "slate-soft-sky",
    "midnight-green-sand",
    "charcoal-lavender-mist",
    "indigo-pearl",
    "soft-teal-warm-grey"
  ];
  var labels = {
    "waylight-lavender-calm": "Waylight Lavender Calm",
    "deep-navy-warm-stone": "Deep Navy & Warm Stone",
    "forest-linen": "Forest & Linen",
    "oxford-blue-mist": "Oxford Blue & Mist",
    "burgundy-parchment": "Burgundy & Parchment",
    "slate-soft-sky": "Slate & Soft Sky",
    "midnight-green-sand": "Midnight Green & Sand",
    "charcoal-lavender-mist": "Charcoal & Lavender Mist",
    "indigo-pearl": "Indigo & Pearl",
    "soft-teal-warm-grey": "Soft Teal & Warm Grey"
  };
  var legacyThemes = {
    atlantic: "waylight-lavender-calm",
    blue: "deep-navy-warm-stone",
    red: "burgundy-parchment",
    yellow: "soft-teal-warm-grey",
    pink: "charcoal-lavender-mist",
    green: "forest-linen",
    purple: "indigo-pearl",
    orange: "midnight-green-sand",
    cream: "slate-soft-sky",
    black: "charcoal-lavender-mist",
    heather: "forest-linen",
    sand: "deep-navy-warm-stone"
  };

  function normalizeTheme(theme) {
    var value = legacyThemes[theme] || theme;
    return themes.indexOf(value) >= 0 ? value : "waylight-lavender-calm";
  }

  function applyTheme(theme, options) {
    var value = normalizeTheme(theme);
    var persist = !options || options.persist !== false;
    root.setAttribute("data-theme", value);

    if (persist) {
      try {
        window.localStorage.setItem(storageKey, value);
      } catch (error) {
        // Ignore storage failures and keep the current in-memory theme.
      }
    }

    var text = labels[value];
    document.querySelectorAll("[data-theme-label]").forEach(function (node) {
      node.textContent = text;
    });
  }

  function nextTheme(currentTheme) {
    var index = themes.indexOf(currentTheme);
    return themes[(index + 1) % themes.length];
  }

  var initialTheme = normalizeTheme(root.getAttribute("data-theme") || "waylight-lavender-calm");
  try {
    initialTheme = window.localStorage.getItem(storageKey) || initialTheme;
  } catch (error) {
    initialTheme = normalizeTheme(root.getAttribute("data-theme") || "waylight-lavender-calm");
  }

  applyTheme(initialTheme, { persist: false });

  document.querySelectorAll("[data-theme-toggle]").forEach(function (button) {
    button.addEventListener("click", function () {
      var activeTheme = normalizeTheme(root.getAttribute("data-theme") || "waylight-lavender-calm");
      applyTheme(nextTheme(activeTheme), { persist: true });
    });
  });
})();
