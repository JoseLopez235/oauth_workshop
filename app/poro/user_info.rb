class UserInfo
  attr_reader :id,
              :login,
              :token
  def initialize(user_data, access_token)
    @id = user_data[:id]
    @login = user_data[:login]
    @token = access_token
  end
end
