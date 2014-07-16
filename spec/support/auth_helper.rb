# auth_helper.rb

module AuthHelper
  def http_login
    user = 'qcbs-test'
    pw = 'qcbs-test'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    # request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("qcbs-test", "qcbs-test")

  end
end