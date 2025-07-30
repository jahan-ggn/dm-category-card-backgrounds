import Component from "@glimmer/component";
import { service } from "@ember/service";

export default class CategoryCardBgSetter extends Component {
  @service site;

  constructor() {
    super(...arguments);
    const isDarkMode =
      getComputedStyle(document.body)
        .getPropertyValue("--scheme-type")
        .trim() === "dark";
    const isMobile = this.site.isMobileDevice;
    const category = this.args?.outletArgs?.category || {};
    let url = "";

    if (isDarkMode) {
      url = isMobile
        ? category.category_card_bg_image_dark_mobile
        : category.category_card_bg_image_dark;
    } else {
      url = isMobile
        ? category.category_card_bg_image_light_mobile
        : category.category_card_bg_image_light;
    }

    if (url) {
      document.documentElement.style.setProperty(
        "--category-card-background-image",
        `url('${url}')`
      );
      document.body.classList.add("category-card-bg-active");
    } else {
      document.documentElement.style.removeProperty(
        "--category-card-background-image"
      );
      document.body.classList.remove("category-card-bg-active");
    }
  }
}
