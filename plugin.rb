# frozen_string_literal: true

# name: dm-category-card-backgrounds
# about: Adds support for custom background images on Discourse category info cards.
# version: 0.0.1
# authors: Jahan Gagan
# url: https://github.com/jahan-ggn/dm-category-card-backgrounds

enabled_site_setting :dm_category_card_backgrounds_enabled

module ::DmCategoryCardBackgrounds
  PLUGIN_NAME = "dm-category-card-backgrounds"
end

register_asset "stylesheets/common/common.scss"

after_initialize do
  # Register all custom fields for preloading
  bg_fields = %w[
    category_card_bg_image_light
    category_card_bg_image_dark
    category_card_bg_image_light_mobile
    category_card_bg_image_dark_mobile
  ]

  bg_fields.each do |field|
    register_preloaded_category_custom_fields field
  end

  bg_fields.each do |field|
    add_to_serializer(:basic_category, field.to_sym, include_condition: -> {
      SiteSetting.dm_category_card_backgrounds_enabled && object.custom_fields[field].present?
    }) do
      upload_id = object.custom_fields[field]
      upload = Upload.find_by(id: upload_id)
      upload&.url
    end
  end

  if respond_to?(:register_upload_in_use)
    register_upload_in_use do |upload|
      CategoryCustomField.where(
        name: bg_fields,
        value: upload.id.to_s
      ).exists?
    end
  end
end