# Threadクラスを使用したサンプルです。
# 単純に10まで数えるThreadを3つ用意してるだけです。
# ※rubyのthreadはjavaなどと違ってsleep時に
# 　スレッドの切り替えが行われています。
# 　そのため、javaに近づけるようにsleep時間をランダムにして対応しています。

threads = []

# 3つ分のスレッドを作成
3.times { |i|
	# スレッドを作成
	threads << Thread.start(i) { |id|
		# 1～10まで数える
		10.times { |j|
			j = j + 1
			puts id.to_s + ': ' + j.to_s

			# スレッドを切り替えるためのスリープ
			sleep(rand(0.01..1.0))
		}
	}
}

# メインスレッドが終わると処理が終了するので
# joinで他のスレッドの終了を待つ
threads.each { |thread|
	thread.join
}
