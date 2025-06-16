import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import UppyImageUploader from "discourse/components/uppy-image-uploader";
import { i18n } from "discourse-i18n";

export default class CategoryCardBackgroundUploader extends Component {
  @tracked categoryCustomFields = this.args.category.custom_fields;

  @tracked
  lightBackgroundUrl =
    this.categoryCustomFields.category_card_bg_image_light ?? "";

  @tracked
  darkBackgroundUrl =
    this.categoryCustomFields.category_card_bg_image_dark ?? "";

  @action
  onLightUploadComplete(upload) {
    this.lightBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_light = upload.url;
  }

  @action
  onLightUploadDelete() {
    this.lightBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_light = "";
  }

  @action
  onDarkUploadComplete(upload) {
    this.darkBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_dark = upload.url;
  }

  @action
  onDarkUploadDelete() {
    this.darkBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_dark = "";
  }

  <template>
    <section class="field category-card-background">
      <label>{{i18n "category_card.light_bg_image"}}</label>
      <UppyImageUploader
        @imageUrl={{this.lightBackgroundUrl}}
        @onUploadDone={{this.onLightUploadComplete}}
        @onUploadDeleted={{this.onLightUploadDelete}}
        @type="category_card_bg_image_light"
        @id="category-card-bg-image-uploader-light"
        class="no-repeat contain-image"
      />
    </section>

    <section class="field category-card-background">
      <label>{{i18n "category_card.dark_bg_image"}}</label>
      <UppyImageUploader
        @imageUrl={{this.darkBackgroundUrl}}
        @onUploadDone={{this.onDarkUploadComplete}}
        @onUploadDeleted={{this.onDarkUploadDelete}}
        @type="category_card_bg_image_dark"
        @id="category-card-bg-image-uploader-dark"
        class="no-repeat contain-image"
      />
    </section>
  </template>
}
