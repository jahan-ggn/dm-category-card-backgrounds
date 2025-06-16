import Component from "@glimmer/component";

export default class CategoryCardBgSetter extends Component {
  constructor() {
    super(...arguments);

    const schemeType = getComputedStyle(document.body)
      .getPropertyValue("--scheme-type")
      .trim();

    const customFields = this.args?.outletArgs?.category?.custom_fields || {};
    let url = "";

    if (schemeType === "dark") {
      url = customFields.category_card_bg_image_dark || "";
    } else {
      url = customFields.category_card_bg_image_light || "";
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
