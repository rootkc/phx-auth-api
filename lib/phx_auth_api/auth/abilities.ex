alias PhxAuthApi.Auth.User
defimpl Canada.Can, for: User do
  def can?(%User{ id: id }, action, %User{ id: user_id }) do
    id == user_id
  end

  def can?(_ , _, _) do
    false
  end
end
