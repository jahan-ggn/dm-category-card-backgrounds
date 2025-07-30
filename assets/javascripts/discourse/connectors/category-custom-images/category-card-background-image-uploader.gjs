import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import UppyImageUploader from "discourse/components/uppy-image-uploader";
import { i18n } from "discourse-i18n";

export default class CategoryCardBackgroundUploader extends Component {
  @tracked categoryCustomFields = this.args.category.custom_fields;

  @tracked
  lightBackgroundUrl = this.args.category.category_card_bg_image_light ?? "";

  @tracked
  darkBackgroundUrl = this.args.category.category_card_bg_image_dark ?? "";

  @tracked
  mobileLightBackgroundUrl =
    this.args.category.category_card_bg_image_light_mobile ?? "";

  @tracked
  mobileDarkBackgroundUrl =
    this.args.category.category_card_bg_image_dark_mobile ?? "";

  @action
  onLightUploadComplete(upload) {
    this.lightBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_light = upload.id;
  }

  @action
  onLightUploadDelete() {
    this.lightBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_light = "";
  }

  @action
  onDarkUploadComplete(upload) {
    this.darkBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_dark = upload.id;
  }

  @action
  onDarkUploadDelete() {
    this.darkBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_dark = "";
  }

  @action
  onMobileLightUploadComplete(upload) {
    this.mobileLightBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_light_mobile = upload.id;
  }

  @action
  onMobileLightUploadDelete() {
    this.mobileLightBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_light_mobile = "";
  }

  @action
  onMobileDarkUploadComplete(upload) {
    this.mobileDarkBackgroundUrl = upload.url;
    this.categoryCustomFields.category_card_bg_image_dark_mobile = upload.id;
  }

  @action
  onMobileDarkUploadDelete() {
    this.mobileDarkBackgroundUrl = "";
    this.categoryCustomFields.category_card_bg_image_dark_mobile = "";
  }

  get backgroundConfigs() {
    return [
      {
        label: "category_card.light_bg_image",
        value: this.lightBackgroundUrl,
        onUpload: this.onLightUploadComplete,
        onDelete: this.onLightUploadDelete,
        id: "category-card-bg-image-uploader-light",
        type: "category_card_bg_image_light",
      },
      {
        label: "category_card.dark_bg_image",
        value: this.darkBackgroundUrl,
        onUpload: this.onDarkUploadComplete,
        onDelete: this.onDarkUploadDelete,
        id: "category-card-bg-image-uploader-dark",
        type: "category_card_bg_image_dark",
      },
      {
        label: "category_card.light_bg_image_mobile",
        value: this.mobileLightBackgroundUrl,
        onUpload: this.onMobileLightUploadComplete,
        onDelete: this.onMobileLightUploadDelete,
        id: "category-card-bg-image-uploader-light-mobile",
        type: "category_card_bg_image_light_mobile",
      },
      {
        label: "category_card.dark_bg_image_mobile",
        value: this.mobileDarkBackgroundUrl,
        onUpload: this.onMobileDarkUploadComplete,
        onDelete: this.onMobileDarkUploadDelete,
        id: "category-card-bg-image-uploader-dark-mobile",
        type: "category_card_bg_image_dark_mobile",
      },
    ];
  }

  <template>
    {{#each this.backgroundConfigs as |bg|}}
      <section class="field category-card-background">
        <label>{{i18n bg.label}}</label>
        <UppyImageUploader
          @imageUrl={{bg.value}}
          @onUploadDone={{bg.onUpload}}
          @onUploadDeleted={{bg.onDelete}}
          @type={{bg.type}}
          @id={{bg.id}}
          class="no-repeat contain-image"
        />
      </section>
    {{/each}}
  </template>
}
