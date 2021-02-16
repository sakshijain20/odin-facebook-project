class UserMailer < ApplicationMailer

	def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Congratulations!,You have successfully signed up!')
      end
end
