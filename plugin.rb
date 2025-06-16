# frozen_string_literal: true

# name: dm-category-card-backgrounds
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :dm_category_card_backgrounds_enabled

module ::DmCategoryCardBackgrounds
  PLUGIN_NAME = "dm-category-card-backgrounds"
end

require_relative "lib/dm_category_card_backgrounds/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
