module UsersHelper
    #Return a URL of user-image for image-tag based on user-email
    # def gravatar_for(user)
    #     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #     gravatar_url = "https://s.gravatar.com/avatar/#{gravatar_id}"
    #     image_tag(gravatar_url, alt: user.name, class: "gravatar")
    # end

    def gravatar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end   
end
