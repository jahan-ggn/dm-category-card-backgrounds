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

require_relative "lib/dm_category_card_backgrounds/engine"

register_asset "stylesheets/common/common.scss"

after_initialize do
  %w[
    category_card_bg_image_light
    category_card_bg_image_dark
    category_card_bg_image_light_mobile
    category_card_bg_image_dark_mobile
  ].each do |field|
    register_preloaded_category_custom_fields field
  end

  %w[
    category_card_bg_image_light
    category_card_bg_image_dark
    category_card_bg_image_light_mobile
    category_card_bg_image_dark_mobile
  ].each do |field|
    add_to_serializer(:basic_category, field.to_sym, include_condition: -> {
      SiteSetting.dm_category_card_backgrounds_enabled && object.custom_fields[field].present?
    }) do
      object.custom_fields[field]
    end
  end
end
