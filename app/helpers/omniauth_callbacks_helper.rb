module OmniauthCallbacksHelper
	def provider_name provider
		provider == :facebook ? "Facebook" : "Google"
	end
end
