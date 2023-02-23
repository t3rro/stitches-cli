source %(https://rubygems.org)

group :development do
  %w[
    solargraph
    keycutter
    rubocop
    rspec
    rake
    yard
  ].each do |this_gem|
    gem this_gem
  end
end

group :production do
  %w[stitches-terraform-synthesizer].each do |this_gem|
    gem this_gem
  end
end
