class GithubApiService
  def self.access_token(client_id, client_secret, code)
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end
    data = JSON.parse(response.body, symbolize_names: true)
    data[:access_token]
  end

  def self.user_data(access_token)
    response = conn_api(access_token).get('/user')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.private_repos(access_token)
    response = conn_api(access_token).get('/user/repos') do |req|
      req.params['type'] = 'private'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.public_repos(access_token)
    response = conn_api(access_token).get('/user/repos')
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  def self.conn_api(access_token)
    Faraday.new(
      url: 'https://api.github.com',
      headers: {
          'Authorization': "token #{access_token}"
      }
    )
  end

  def self.conn
    Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
  end
end
