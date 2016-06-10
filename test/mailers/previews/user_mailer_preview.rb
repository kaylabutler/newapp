# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("ana.afonso.01@gmail.com", "Ana", "Hello World!")
  end
end