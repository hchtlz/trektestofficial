module.exports = {
  plugins: [
    require("postcss-import"),
    // call the `postcss-modules` plugin ourselves
    require("postcss-modules")({
      generateScopedName: (name, filename, _css) => {
        const matches = filename.match(
          /\/app\/components\/?(.*)\/.*_component.css$/
        );

        // Do not transform CSS files from outside of the components folder
        if (!matches) return name;

        // identifier here is the same identifier we used for Stimulus controller (see above)
        const identifier = matches[1]
          .replace(/\//g, "--")
          .replace("_component", "")
          .replace(/_/g, "-");

        // We also add the `c-` prefix to all components classes
        return `c-${identifier}-${name}`;
      },
      // Do not generate *.css.json files (we don't use them)
      getJSON: () => {},
    }),
    require("postcss-flexbugs-fixes"),
    require("postcss-inline-svg")({
      paths: ["app/assets/icons"],
    }),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
      features: {
        "custom-media-queries": true,
        "media-query-ranges": true,
      },
    }),
  ],
};
