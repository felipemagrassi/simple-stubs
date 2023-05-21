require 'spec_helper'
require 'dashboard'

describe Dashboard do
  describe '#posts' do
    it 'returns posts created today' do
      first_post = build_stubbed(:post, title: 'first_today', created_at: Time.now)
      last_post = build_stubbed(:post, title: 'last_today', created_at: Time.now)
      posts = [first_post, last_post]

      dashboard = Dashboard.new(posts: posts)
      allow(dashboard).to receive(:todays_posts).and_return(posts)

      result = dashboard.todays_posts

      expect(result.map(&:title)).to match_array(%w[first_today last_today])
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
