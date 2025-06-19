const esbuild = require("esbuild");
const rails = require("esbuild-rails");
const postCssPlugin = require("esbuild-style-plugin");
const glob = require("glob").sync;

if (process.env.NODE_ENV === undefined) {
  process.env.NODE_ENV = process.env.RAILS_ENV || "development";
}

let config = esbuild.build({
  plugins: [
    rails(),
    postCssPlugin({
      postcssConfigFile: true,
    }),
  ],
  entryPoints: glob("app/javascript/*.*"),
  bundle: true,
  platform: "browser",
  watch: process.argv.includes("--watch"),
  sourcemap: !process.argv.includes("--watch"),
  outdir: "app/assets/builds",
  loader: {
    ".png": "file",
    ".svg": "file",
    ".woff": "file",
    ".woff2": "file",
  },
  logLevel: "debug",
  minify: process.env.NODE_ENV === "production",
  define: { DEBUG: process.env.NODE_ENV !== "production" },
});

if (!process.argv.includes("--watch")) {
  config.catch(() => process.exit(1));
}
