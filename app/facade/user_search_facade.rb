class UserSearchFacade
  def self.user(client_id, client_secret, code)
    access_token = GithubApiService.access_token(client_id, client_secret, code)

    UserInfo.new(GithubApiService.user_data(access_token), access_token)
  end
end
