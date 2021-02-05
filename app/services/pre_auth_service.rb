class PreAuthService
  def self.get(account_id)
    new(account_id).pre_auth_response
  end

  def pre_auth_response
    JSON.parse(conn.body, symbolize_names: true)[:accounts][0][:url]
  end

  private

  def initialize(account_id)
    @account_id = account_id
  end

  def conn
    uri = "https://api.fastspring.com"
    conn = Faraday.new(uri)
    conn.basic_auth(
      Rails.application.credentials.fastspring[:username],
      Rails.application.credentials.fastspring[:password]
    )
    conn.get("/accounts/#{@account_id}/authenticate")
  end
end