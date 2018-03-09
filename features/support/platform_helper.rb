module PlatformHelper
  require File.join(Rails.root, 'db', 'platforms')
  
  def get_platform_attrs(index=nil)
    PlatformData::sample_attributes[index || 0]
  end
  
  def get_platform(index)
    # puts "platform_helper get_platform #{index}"
    Platform.create get_platform_attrs(index)
  end
  
  def get_platforms
    Platform.create PlatformData::sample_attributes
  end
  
  def get_platform_by_nickname(nickname)
    get_platforms.find {|p| p.nickname == nickname }
  end
  
  def get_html_entry(index=nil)
    PlatformData::sample_html_entries[index || 0]
  end
end