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
  if SiteSetting.dm_category_card_backgrounds_enabled
    register_preloaded_category_custom_fields "category_card_bg_image_light"
    register_preloaded_category_custom_fields "category_card_bg_image_dark"

    add_to_serializer(:basic_category, :category_card_bg_image_light) do
      object.custom_fields["category_card_bg_image_light"]
    end

    add_to_serializer(:basic_category, :category_card_bg_image_dark) do
      object.custom_fields["category_card_bg_image_dark"]
    end

    add_to_serializer(:basic_category, :include_category_card_bg_image_light?) { true }
    add_to_serializer(:basic_category, :include_category_card_bg_image_dark?) { true }
  end
end