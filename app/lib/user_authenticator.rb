class UserAuthenticator

  class AuthenticationError < StandardError; end

  attr_reader :user
  def initialize(code)
    
  end

  def perform
    client = Octokit::Client.new(
      client_id: ENV['GITHUB_CLIENT_ID'],
      client_secret: ENV['GITHUB_CLIENT_SECRET']
    )
    raise AuthenticationError
  end
  
end