class ApplicationController < ActionController::API

  def auth_token
    return validate_token if token_header.present?
    render json: { error: 'Credential is not present.' }, status: 403
  end

  private

  def token_header
    request.headers[:TOKEN]
  end

  def validate_token
    render json: { error: 'Bad credentials'}, status: 401 unless token_header.eql?(token_platform)
  end

  def token_platform
    ENV['ACCESS_TOKEN']
  end
end
