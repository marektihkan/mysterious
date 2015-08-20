module Mysterious
  module Api
    module Responses
      def success(content = nil)
        status = content ? 200 : 204
        respond(content, status: status)
      end

      def error(status, message, errors = nil)
        content = { message: message }
        content[:errors] = errors if errors
        respond(content, status: status)
      end

      def invalid_request(message = nil, errors = nil)
        error(400, message || 'Invalid request. Please check the parameters.', errors)
      end

      def unauthorized(message = nil)
        error(401, message || 'You need to sign in to access requested resource.')
      end

      def access_denied(message = nil)
        error(403, message || "You don't have access to requested resource.")
      end

      def not_found(message = nil)
        error(404, message || 'Resource was not found.')
      end

      def validation_failed(errors)
        error(422, 'Validation failed.', errors)
      end

      def server_error(message = nil)
        respond({ status: message }, status: 500)
      end
    end
  end
end
