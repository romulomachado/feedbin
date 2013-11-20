FactoryGirl.define do
  factory :entry do
    sequence(:title) { |n| "Title #{n}"}
    url 'http//blogs.wsj.com/washwire/2013/08/23/nsa-officers-sometimes-spy-on-love-interests/'
    author 'John Gruber'
    summary 'The biggest problem with the NSA scandal is the lack of accountability. ★'
    content '<p>The biggest problem with the NSA scandal is the lack of accountability.</p>\n\n<div>\n<a  title=\'Permanent link to ‘&#8216;LOVEINT&#8217;’\'  href=\'http//daringfireball.net/linked/2013/08/23/loveint\'>&nbsp;★&nbsp;</a>\n</div>'
    sequence(:published)     { |n| "2013-08-24 012#{n}10" }
    sequence(:updated)       { |n| "2013-08-24 013#{n}22" }
    sequence(:created_at)    { |n| "2013-08-24 124#{n}15" }
    sequence(:updated_at)    { |n| "2013-08-24 124#{n}15" }
    sequence(:entry_id)
    sequence(:public_id)     { |n| "c59fc9641caf56dccceee33d2fd3d9a2b07d02c#{n}" }
    sequence(:old_public_id) { |n| "c59fc9641caf56dccceee33d2fd3d9a2b07d02c#{n}" }
    starred_entries_count 0
    association :feed, factory: :feed
  end

  factory :unread_entry do
  end

  factory :feed do
    sequence(:title) { |n| "Feedbin Blog #{n}" }
    sequence(:feed_url) { |n| "Feed URL #{n}" }
    site_url 'http://blog.feedbin.me'
    etag nil
    sequence(:created_at)   { |n| "2013-08-24 12:4#{n}:51" }
    sequence(:updated_at)   { |n| "2013-08-24 12:4#{n}:51" }
    sequence(:last_modified) { |n| "2013-08-24 08:3#{n}:58"}
    subscriptions_count 1
  end

  factory :starred_entry do
  end

  factory :subscription do
  end

  factory :tag do
    sequence(:name) { |n| "Tag #{n}"}
    sequence(:created_at)   { |n| "2013-08-24 12:4#{n}:31" }
    sequence(:updated_at)   { |n| "2013-08-24 12:4#{n}:31" }
  end

  factory :tagging do
  end

  factory :basic_monthly_plan, class: Plan do
    stripe_id 'basic-monthly'
    name 'Monthly'
    price 2
    price_tier 1
  end

  factory :basic_monthly_plan_2, class: Plan do
    stripe_id 'basic-monthly-2'
    name 'Monthly'
    price 3
    price_tier 2
  end

  factory :basic_yearly_plan, class: Plan do
    stripe_id 'basic-yearly'
    name 'Yearly'
    price 20
    price_tier 1
  end

  factory :basic_yearly_plan_2, class: Plan do
    stripe_id 'basic-yearly-2'
    name 'Yearly'
    price 30
    price_tier 2
  end

  factory :trial_plan, class: Plan do
    stripe_id 'trial'
    name 'Trial'
    price 0
    price_tier 2
  end

  factory :user do
    sequence(:email) { |n| "email#{n}@example.com"}
    password 'passw0rd'
    password_confirmation 'passw0rd'
    update_auth_token true
    association :plan, factory: :basic_monthly_plan_2
  end

  factory :admin_user, class: User do
    email 'admin@example.com'
    password 'passw0rd'
    password_confirmation 'passw0rd'
    admin true
    association :plan, factory: :basic_monthly_plan_2
  end
end
