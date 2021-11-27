$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "hotglue/version"
# require 'byebug'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "hot-glue"
  spec.version     = HotGlue::VERSION
  spec.license     = 'Nonstandard'
  spec.date        = Time.now.strftime("%Y-%m-%d")
  spec.summary     = "A gem build scaffolding."
  spec.description = "Simple, plug & play Rails scaffold building companion for Turbo-Rails and Hotwire"
  spec.authors     = ["Jason Fleetwood-Boldt"]
  spec.email       = 'code@jasonfb.net'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)}) || f.match(%r{(gemspec|gem)$}) }
    files
  end

  spec.add_runtime_dependency "rails",  '> 5.1', '<= 7.0.0'
  spec.homepage    = 'https://jasonfleetwoodboldt.com/hot-glue/'
  spec.metadata    = { "source_code_uri" => "https://github.com/jasonfb/hot-glue",
                       "documentation_uri" => "https://jfb.teachable.com/p/hot-glue-in-depth-tutorial",
                       "homepage_uri" => 'https://jasonfleetwoodboldt.com/hot-glue/'}

  spec.add_runtime_dependency('kaminari', '~> 1.2')
  spec.add_runtime_dependency('turbo-rails', '> 0.5')
  spec.add_runtime_dependency('sass-rails')

  spec.add_dependency 'ffaker', "~> 2.16"

  spec.post_install_message = <<~MSG
    ---------------------------------------------
    Welcome to Hot Glue - A Scaffold Building Companion for Hotwire + Turbo-Rails
    
    rails generate hot_glue:scaffold Thing

      * Build plug-and-play scaffolding mixing generated ERB or HAML with the power of Hotwire and Turbo-Rails
      * Everything edits-in-place (unless you use --big-edit, then it won't)
      * Automatically Reads Your Models (make them before building your scaffolding!)
      * Excellent for CREATE-READ-UPDATE-DELETE (CRUD), lists with pagination (coming soon: searching & sorting)
      * Great for prototyping, but you should learn Rails fundamentals first.
      * 'Packaged' with Devise, Kaminari, Rspec, FontAwesome
      * Create system specs  automatically along with the generated code.
      * Nest your routes model-by-model for built-in poor man's authentication.
      * Throw the scaffolding away when your app is ready to graduate to its next phase.
      * docs at https://github.com/jasonfb/hot-glue
      * get the tutorial at https://jfb.teachable.com/p/hot-glue-in-depth-tutorial
    ---------------------------------------------
  MSG
end
