module ProfileHelper
	def cache_key_for_profile(user)
		"user-#{user.id}-#{user.updated_at}-#{user.email}"
	end
	# def cache_key_for_profile_bookmarked(user)
	# 	"user-#{user.id}-#{user.updated_at}-#{user.}"
	# end
	# def cache(cache_key_for_profile_liked(user)
	# 	"user-#{user.id}-#{user.updated_at}-#{user.}"
	# end
	# def cache_key_for_profile_cooked(user)
	# 	"user-#{user.id}-#{user.updated_at}-#{user.}"
	# end
	# def cache_key_for_profile_liked_masterpiece(user)
	# 	"user-#{user.id}-#{user.updated_at}-#{user.}"
	# end
end
