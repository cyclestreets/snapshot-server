authorization do
  role :admin do
    includes :guest
    has_permission_on :projects, :to => :manage
  end

  role :guest do
    has_permission_on :devise_sessions, :devise_registrations, :devise_confirmations,
                      :devise_invitations, :devise_passwords, to: :manage
    has_permission_on :site, :to => :index
    has_permission_on :projects, :to => :view
    has_permission_on :api_maps, :to => :view
  end
end

privileges do
  privilege :manage do
    includes :view, :new, :create, :edit, :update, :destroy
  end

  privilege :view do
    includes :index, :show
  end
end
