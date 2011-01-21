class UserNotification < ActionMailer::Base
  default :from => "shop@cup-of.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notification.purchase_created.subject
  #
  def purchase_created(purchase)
    @purchase = purchase
    mail :to => purchase.u_mail, :bcc => ["shop@cup-of.ru", "afanas1984@mail.ru"], :subject => "Ваша покупка на сайте cup-of.ru зарегистрирована"
  end
end
