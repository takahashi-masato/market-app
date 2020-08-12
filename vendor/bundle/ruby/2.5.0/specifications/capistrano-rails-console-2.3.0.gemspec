# -*- encoding: utf-8 -*-
# stub: capistrano-rails-console 2.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-rails-console".freeze
  s.version = "2.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Schwab".freeze]
  s.date = "2018-05-24"
  s.description = "Remote rails console for capistrano".freeze
  s.email = ["me@ydkn.de".freeze]
  s.homepage = "https://github.com/ydkn/capistrano-rails-console".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Remote rails console for capistrano".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["< 4.0.0", ">= 3.5.0"])
      s.add_runtime_dependency(%q<sshkit-interactive>.freeze, ["~> 0.3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["< 4.0.0", ">= 3.5.0"])
      s.add_dependency(%q<sshkit-interactive>.freeze, ["~> 0.3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["< 4.0.0", ">= 3.5.0"])
    s.add_dependency(%q<sshkit-interactive>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
