require "rest-client"

meeting_id = [	'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572362924676',
			  	'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572362505303',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572359769283',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572365492013',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572362245975',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572361701795',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572451087776',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572452061461',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572449285398',
				'6e35e3b2778883f5db637d7a5dba0a427f692e91-1572455086414']

meeting_id.each do  |meeting_id| 
site = 'http://ritz-tts3.freddixon.ca'
secret = 'HihnjRgWRhEjWWFG4YyKStyJKmN2dnDRdmPsqdAfo'
kind = 'subtitles'
lang = 'en_US'
label = 'English'
request = "putRecordingTextTrackrecordID=#{meeting_id}&kind=#{kind}&lang=#{lang}&label=#{label}"
request += secret
checksum = Digest::SHA1.hexdigest(request)

#response = RestClient.get "http://localhost:4000/caption/#{meeting_id}/en-US", {:params => {:site => "https://#{site}", :checksum => "#{checksum}"}}
request = RestClient::Request.new(
    method: :get,
    url: "http://localhost:3000/caption/#{meeting_id}/en-US",
    payload: { :file => File.open("/home/ubuntu/video/audio.flac", 'rb'),
    :bbb_url => "#{site}", :bbb_checksum => "#{checksum}", :kind => "#{kind}", :label => "#{label}"}
)
response = request.execute
#68.183.197.37
end