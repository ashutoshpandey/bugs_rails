# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( jquery-1.10.2.js )
Rails.application.config.assets.precompile += %w( common.js )
Rails.application.config.assets.precompile += %w( login.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )
Rails.application.config.assets.precompile += %w( jquery.simplemodal.js )
Rails.application.config.assets.precompile += %w( jquery.validate.min.js )

Rails.application.config.assets.precompile += %w( users/user-section.js )
Rails.application.config.assets.precompile += %w( users/create.js )
Rails.application.config.assets.precompile += %w( users/edit.js )
Rails.application.config.assets.precompile += %w( users/list.js )
Rails.application.config.assets.precompile += %w( users/profile.js )

Rails.application.config.assets.precompile += %w( bugs/create.js )
Rails.application.config.assets.precompile += %w( bugs/edit.js )
Rails.application.config.assets.precompile += %w( bugs/detail.js )
Rails.application.config.assets.precompile += %w( bugs/list.js )

Rails.application.config.assets.precompile += %w( projects/create.js )
Rails.application.config.assets.precompile += %w( projects/edit.js )
Rails.application.config.assets.precompile += %w( projects/list.js )

Rails.application.config.assets.precompile += %w( common.css )
Rails.application.config.assets.precompile += %w( theme/transdmin.css )
Rails.application.config.assets.precompile += %w( login.css )

Rails.application.config.assets.precompile += %w( bugs/create.css )
Rails.application.config.assets.precompile += %w( bugs/detail.css )
Rails.application.config.assets.precompile += %w( bugs/edit.css )
Rails.application.config.assets.precompile += %w( bugs/list.css )

Rails.application.config.assets.precompile += %w( projects/create.css )
Rails.application.config.assets.precompile += %w( projects/edit.css )
Rails.application.config.assets.precompile += %w( projects/list.css )

Rails.application.config.assets.precompile += %w( users/user-section.css )


Rails.application.config.assets.precompile += %w( projects/list )