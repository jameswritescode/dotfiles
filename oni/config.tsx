import * as React from "react";
import * as Oni from "oni-api";

export const activate = (oni: Oni.Plugin.Api) => {
  oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"));

  oni.input.unbind("<c-p>");
};

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated");
};

export const configuration = {
  "achievements.enabled": false,
  "experimental.markdownPreview.enabled": true,
  "sidebar.enabled": false,
  "statusbar.enabled": false,

  "editor.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "editor.fontSize": "14px",

  "oni.hideMenu": true,
  "oni.loadInitVim": true,
  "oni.useDefaultConfig": false,

  "ui.colorscheme": "nord",
  "ui.fontFamily": "Fira Code",
  "ui.fontSmoothing": "auto"
};
