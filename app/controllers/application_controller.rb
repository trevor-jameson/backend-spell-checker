class ApplicationController < ActionController::API
  # Calls entire auth method chain prior to implementing any other method in App
  before_action :authorized

# Intercepts the user login response from DB and encodes the payload
# then delivers to frontend
def encode_token(payload)
  # Secret environment variable is found in config/application.yml
  JWT.encode(payload, ENV["TBDFIGARO"])
end

# Checks whether Auth header containing JWT exists and returns value if so
def auth_header
    request.headers['Authorization']
end

# Decodes Auth header token if valid, returns error nil if invalid
def decoded_token
  if auth_header
    # Removed token = auth_header.split(' ')[1] here
    begin
      JWT.decode(auth_header, ENV["TBDFIGARO"], true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end
end

# Attemps to find user by id in decoded JWT
def current_user
  if decoded_token
    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
    # Returns nil if not found
  end
end

def logged_in?
  # Double-bang forcibly converts the result of current_user method to boolean
  !!current_user
end

# Prompts user to login if they have not included valid JWT token with their user_id in request
def authorized
  render json: {message: 'Please log in to continue'}, status: :unauthorized unless logged_in?
end

# End of Application Controller
end
