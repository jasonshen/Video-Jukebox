class Video < ActiveRecord::Base

  validates_presence_of :title, :embed_code
  
  validate :must_have_valid_embed_code
  
  def must_have_valid_embed_code
    unless embed_code.include?("<embed") || embed_code.include?("<iframe")
      errors.add(:embed_code, "Must include an embed/iframe tag")
    end
  end
  
end
