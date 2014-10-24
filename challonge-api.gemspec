# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "challonge-api"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["CHALLONGE! LLC"]
  s.date = "2012-11-26"
  s.email = "oss@challonge.com"
  s.files = ["lib/challonge", "lib/challonge/participant.rb", "lib/challonge/tournament.rb", "lib/challonge/match.rb", "lib/challonge/api.rb", "lib/challonge-api.rb"]
  s.homepage = "http://challonge.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.2"
  s.summary = "Preconfigured ActiveResource classes for integrating with CHALLONGE!'s API - http://challonge.com/api"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activeresource>, [">= 0"])
    else
      s.add_dependency(%q<activeresource>, [">= 0"])
    end
  else
    s.add_dependency(%q<activeresource>, [">= 0"])
  end
end
