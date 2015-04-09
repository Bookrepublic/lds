guard 'livereload' do
  watch(%r{app/.*/[^.][^/]+\.(erb|haml|slim)})
  watch(%r{app/helpers/.*/[^.][^/]+\.rb})
  watch(%r{public/(.*/[^.][^/]+\.(css|js|html|sass))}) {|m| m[1] }
  watch(%r{app/assets/(.*/[^.][^/]+\.css)(\.s[ac]ss)?}) { |m| "/assets/#{m[1]}" }
  watch(%r{app/assets/(.*/[^.][^/]+\.js)(\.coffee)?}) { |m| "/assets/#{m[1]}" }
  watch(%r{config/locales/[^.].+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end
