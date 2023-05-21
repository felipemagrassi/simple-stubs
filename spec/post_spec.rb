require 'spec_helper'
require 'post'

describe Post do
  describe '#today' do
    it 'returns posts created today' do
      first_post = build_stubbed(:post, title: 'first_today', created_at: Time.now)
      last_post = build_stubbed(:post, title: 'last_today', created_at: Time.now)
      posts = [first_post, last_post]

      allow(Post).to receive(:today).and_return(posts)

      result = Post.today

      expect(result.map(&:title)).to match_array(%w[first_today last_today])
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
