class ApplicationController < ActionController::API

    def user_id
        decoded_token[0]['user_id']
    end

    def decoded_token
        JWT.decode(request.headers['Authorization'], 'learnlovecode', true, {algorithm: 'HS256'})
    end

    def encoded_token(user)
        JWT.encode({user_id: user.id}, 'learnlovecode', 'HS256')
    end
    
    def current_user
        @user ||= User.find(user_id)
    end

    def logged_in
        !!current_user
    end
end
