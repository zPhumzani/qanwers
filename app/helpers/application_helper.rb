module ApplicationHelper

	def admin_only?
	  if current_user.admin?
	  	return true
	  else
	  	return false
	  end
	end

	def tag_links(tags)
	  tags.split(", ").map{|tag| link_to tag.strip, tag_path(tag.strip)}.join(", ")
	end

	def tag_cloud(tags, classes)
	  max = tags.sort_by(&:count).last
	  tags.each do |tag|
	  	index = tag.count.to_f / max.count * (classes.size - 1)
	  	yield(tag, classes[index.round])
	  end
	end

	def title(text)
	  content_for(:title) {|text| text.to_s }
	end

	def description(text)
	  content_for(:description) {|text| text.to_s }
	end
end
