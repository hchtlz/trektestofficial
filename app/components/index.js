import { application } from "../javascript/controllers/application";
import components from "./**/*_component.js";

components.forEach((component) => {
  const path = component.filename;

  // Check whether a module has the Controller export defined
  if (!component.module.Controller) return;

  // Convert path into a controller identifier:
  //   example_component/example_component.js -> example
  //   nav/user_info_component/user_info_component.js -> nav--user-info
  const identifier = /^(.+)_component\//
    .exec(path)[1]
    .replace(/^\.\//, "")
    .replace(/_/g, "-")
    .replace(/\//g, "--");

  application.register(identifier, component.module.Controller);
});
