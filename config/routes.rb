# frozen_string_literal: true

DmCategoryCardBackgrounds::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::DmCategoryCardBackgrounds::Engine, at: "dm-category-card-backgrounds" }
