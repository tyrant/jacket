Factory.define :user do |u|
  u.name { |n| n.sequence "#{n}" }
end

Factory.define :title do |t|
  t.title { |t| t.sequence "#{t}" }
  t.user { |u| u.association(:user) }
end

Factory.define :illustration do |i|
  i.image File.new(Rails.root + 'public/robots.txt')
  i.user { |u| u.association(:user) }
end

Factory.define :cover do |c|
  c.title { |t| t.association(:title) }
  c.illustration { |i| i.association(:illustration) }
end
