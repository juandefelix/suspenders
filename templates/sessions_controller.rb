module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      private

      def render_create_success
        render json: @resource, serializer: Api::V1::UserAuthenticationSerializer
      end

      def render_new_error
        render_json_bad_request(resource_errors[:full_messages])
      end

      def render_create_error_bad_credentials
        render_json_bad_request([I18n.t("devise_token_auth.sessions.bad_credentials")])
      end

      def resource_params
        params.require(:user).permit(
          :email,
          :password
        )
      end
    end
  end
end