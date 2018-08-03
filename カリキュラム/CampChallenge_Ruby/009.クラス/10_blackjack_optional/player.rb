require './user'
require './define'

STDOUT.sync = true

class Player < User

	@@total_players = 0

	def initialize(limit)
		super(limit)

		@@total_players += 1

		##########
		# 名前作成
		##########

		@name = Define.name

		##########
		# チップ
		##########

		@tip = rand(900001) + 1000

		puts @name + 'さんがチップ' + @tip.to_s + '枚で参加しました。'

		##########
		# ディーラー情報
		##########

		@dealer_info = {}
		13.times { |i|
			i = i + 1
			@dealer_info[i] = {}
			(17..21).each { |j|
				@dealer_info[i][j] = 0
			}

			@dealer_info[i]["BJ"] = 0
			@dealer_info[i]["BURST"] = 0
		}

		virtual_dealer = Dealer.new
		10000.times { |i|
			virtual_dealer.shuffle
			virtual_dealer.add_card(virtual_dealer.deal, true)
			while virtual_dealer.hit?
				virtual_dealer.add_card(virtual_dealer.hit)
			end

			dealer_total = virtual_dealer.total
			dealer_total = "BURST" if dealer_total > 21
			dealer_total = "BJ" if virtual_dealer.blackjack?

			@dealer_info[virtual_dealer.first_open_card][dealer_total] += 1
		}


		@burst_rate_weight = rand(1.0)
		@win_rate_weight = 1 - @burst_rate_weight
	end

	def hit?(dealer_open_card)
		# ゲーム中にスタンドしたらスタンド
		return false if @is_stand

		# ブラックジャックになっていたらスタンド
		if total == 21
			@is_stand = true
			return false
		end

		# 11以下であれば何を引いても大丈夫なので
		# 必ずヒットとする
		if total <= 11
			return true
		end

		# バースト確率を計算
		over_count = 0
		limit = 21 - total
		@@cards.each { |card|
			over_count += 1 if card > limit
		}

		# ディーラーの伏せカードも考慮する
		over_count += 1 if @@hide_card > limit

		burst_rate = over_count.fdiv(@@cards.length)

		# 現在の手札で勝てる確率を計算
		win_rate_count = 0
		rate_count = 0
		@dealer_info[dealer_open_card].each { |key, value|
			rate_count += value
			next if !key.instance_of?(Integer)
			win_rate_count += value if key <= total
		}

		win_rate_count += @dealer_info[dealer_open_card]["BURST"]
		win_rate = win_rate_count.fdiv(rate_count)

		burst_rate_weight = 0.4
		win_rate_weight = 0.6
		hit_rate = 1 - (burst_rate * @burst_rate_weight + win_rate * @win_rate_weight)
		hit_rate = 1 - burst_rate if win_rate.nan?

		# スタンド判定を更新
		@is_stand = hit_rate < @limit
		return !@is_stand
	end

	def name
		return @name
	end

	def tip
		return @tip
	end

	def bet(tip=-1)
		return @bet if tip == -1

		@bet = tip
		@tip -= tip
		@balance -= @bet
	end

	def receive_devidend(devidend)
		print name + 'さんは負けました(' + (tip + bet).to_s + ' → ' + tip.to_s + ') ' if devidend == 0
		print name + 'さんはドローです(' + (tip + devidend).to_s + ') ' if devidend == @bet
		print name + 'さんは勝ちました(' + (tip + bet).to_s + ' → ' + (tip + devidend).to_s + ') ' if devidend > @bet

		@tip += devidend
		@balance += devidend
		puts '計' + game_count.to_s + '回参加、総収支: ' + balance.to_s 
	end

	def stop?
		return tip < @@minimum_bet
	end

	def self.total_players
		return @@total_players
	end

	def update_dealer_info(total, first_open, is_blackjack)
		if total > 21
			@dealer_info[first_open]["BURST"] += 1
			return
		end

		if is_blackjack
			@dealer_info[first_open]["BJ"] += 1
			return
		end

		@dealer_info[first_open][total] += 1
	end

	def dealer_info
		return @dealer_info
	end
end
