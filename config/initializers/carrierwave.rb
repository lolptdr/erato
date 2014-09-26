# Prevent non-standard characters from staining file
# names when uploading
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/