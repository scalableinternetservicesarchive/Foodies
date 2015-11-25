module MasterpiecesHelper
  def cache_key_for_masterpiece_show(masterpiece)
    max_users_liking_it_update = masterpiece.users_liking_it.max_by(&:updated_at).updated_at.try(:utc).try(:to_s, :number)
    "masterpiece-show-#{masterpiece.id}-#{masterpiece.updated_at.try(:utc).try(:to_s, :number)}-#{masterpiece.recipe.updated_at.try(:utc).try(:to_s, :number)}-#{current_user.id if current_user}-#{max_users_liking_it_update}"
  end
end
