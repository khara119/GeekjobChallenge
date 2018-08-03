time = Time.now
puts '現在の時刻は' + time.strftime('%Y-%m-%d %H:%M:%S') +
	'であることをおしらせします' if time.sec <= 30
