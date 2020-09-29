class Auth::GuardValidation < ApplicationService
  
  def validate_facebook(auth_token)
    validate_auth_token(auth_token)
  end

  def validate_google(auth_token)
    validate_auth_token(auth_token)
    error_validate_failed!("ยังไม่ได้ใส่ App access token ของ facebook") if ENV['FACEBOOK_APP_ACCESS_TOKEN'].nil?
  end

  def validate_apple(auth_token)
    validate_auth_token(auth_token)
    error_validate_failed!("ยังไม่ได้ใส่ Settings ของ Apple") if Settings.apple.nil?
    error_validate_failed!("ยังไม่ได้ใส่ client_id ที่ Settings ของ Apple") if Settings.apple.client_id.nil?
    error_validate_failed!("ยังไม่ได้ใส่ redirect_url ที่ Settings ของ Apple") if Settings.apple.redirect_url.nil?
    error_validate_failed!("ยังไม่ได้ใส่ team_id ที่ Settings ของ Apple") if Settings.apple.team_id.nil?
    error_validate_failed!("ยังไม่ได้ใส่ key_id ที่ Settings ของ Apple") if Settings.apple.key_id.nil?
    error_validate_failed!("ยังไม่ได้ใส่ key_file ที่ Settings ของ Apple") if Settings.apple.key_file.nil?
  end

  def validate_auth_token(auth_token)
    error_validate_failed!("ไม่มี params auth_token") if auth_token.nil?
  end

  def validate_get_or_initialize_user(account_id, token_type)
    error_validate_failed!("ไม่มี params account_id") if account_id.nil?
    error_validate_failed!("ไม่มี params token_type") if token_type.nil?
  end

  def validate_update_user(user, auth_token, email, name, first_name, last_name)
    error_validate_failed!("ไม่มี params user")       if user.nil?
    error_validate_failed!("ไม่มี params auth_token") if auth_token.nil?
    error_validate_failed!("ไม่มี params email")      if email.nil?
    error_validate_failed!("syntax email error")     if validate_syntax_email(email)
    error_validate_failed!("ไม่มี params name")       if name.nil?
    error_validate_failed!("ไม่มี params first_name") if first_name.nil?
    error_validate_failed!("ไม่มี params last_name")  if last_name.nil?
  end

  def validate_request_auth_facebook(response_hash)
    error_validate_failed!("request auth facebook error") if response_hash["data"]["error"].present?
  end

  def validate_request_profile_facebook(response_hash)
    error_validate_failed!("request profile facebook error") if response_hash["error"]
  end

  def validate_request_auth_google(response_hash)
    error_validate_failed!("request auth google error") if response_hash["error"]
  end

  def validate_request_auth_apple(response_hash)
    error_validate_failed!("request auth apple error by #{response_hash["error"]}") if response_hash["error"]
  end


  def validate_syntax_email(email)
    pattern = URI::MailTo::EMAIL_REGEXP
    !pattern.match?(email)
  end
end

