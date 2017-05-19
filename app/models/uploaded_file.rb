# Model for storing temporary uploaded files in the DB
class UploadedFile < ActiveRecord::Base
  enum preference: %i(workInSf liveInSf neighborhoodResidence)

  # override as_json to omit the actual binary file since it's big and unncessary
  def as_json(_options = {})
    super(except: %i(file))
  end

  def descriptive_name
    "#{preference_name} - #{document_type}#{File.extname(name)}"
  end

  def preference_name
    # for neighborhoodResidence we combine NRHP and liveInSf in the filename
    # because NRHP proof doubles as liveInSf proof
    if preference.to_s == 'neighborhoodResidence'
      'NRHP-liveInSf'
    else
      preference
    end
  end
end
