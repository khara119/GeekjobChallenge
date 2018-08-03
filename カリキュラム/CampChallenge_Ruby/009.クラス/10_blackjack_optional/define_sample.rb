# このファイルをdefine.rbにコピーして使うべし
class Define
	@@names = [
		'ここに',
		'使いたい',
		'名前を',
		'どんどん',
		'足せば',
		'いいよ'
	]

	def self.name
		return @@names[rand(@@names.length)]
	end
end
