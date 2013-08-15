# encoding: UTF-8
require "dxruby"
class Stage 
	
	attr_accessor :bullets,:stageList ,:count

	def initialize
		
		@count = 0
		#ステージ上の初期配置などを設定
		@stageList = Array.new(18).map{Array.new(20,0)}#弾とメイン画像の入った位置配列
		@bullets = []
		@removeList = Array.new(18).map{Array.new(20,0)}
		@checkedList = Array.new(18).map{Array.new(20,0)}
	end

	def joined_bullet(x, y, type)
		puts "あたり判定"
		@count = 0
		search(x,y,type)
		@checkedList = Array.new(18).map{Array.new(20,0)}
		@stageList.each do |v|
			p v
		end
		if @count > 2 then
			puts "3個以上検知したよ！"
			
			#該当するBullet消します
			@removeList.each do |v|
				if v.instance_of?(Bullet) then
					@stageList[v.stage_y][v.stage_x] = 0
					#@bullets.delete(v)
					v.vanished = true
				else 
					# if @stageList[v["y"]][v["x"]] != 9 then
					# 	@stageList[v["y"]][v["x"]] = 0
					# end
				end
			end
			puts "delete"
		end
		@removeList.clear
 	 end

 	 def search(x,y,type)
 	 	if @checkedList[y][x] == 1
 	 		return
 	 	end
 	 	puts "check y:#{y},x:#{x}"
 	 	instance = @stageList[y][x]
 	 	#Sp instance
 	 	if instance.instance_of?(Bullet) then
 	 		if instance.type == type then
 	 			@checkedList[y][x] = 1
 	 			@removeList << instance
 	 			@count += 1
 	 			puts "counting!"
 	 				
 	 		else 
 	 			puts "type not equals"
 	 			return 
 	 		end
 	 	else 
 	 		if @stageList[y][x] == type then
	 	 		@checkedList[y][x] = 1
	 	 		@removeList << {"y"=>y,"x"=>x}
	 	 		@count += 1
 	 		else 
 	 			return
 	 		end
 	 	end

 	 	if y < 17 then
	 	 	search x,y+1,type
			search x,y-1,type
		end
		if x < 19 then
			search x+1,y,type
			search x-1,y,type
		end
	end

#	def joined_main_img(x, y, type)
#
#	end

#	def bullet_fall()
#		end
#	end
end


#class StagePoint 
#	attr_accessor :x,:y
#	def initialize(x,y) 
#		@x = x
#		@y = y
#	end
#end

	# tmp = Stage.new( [
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 # 		[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
	# 	[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	# ])

	# tmp.joined_bullet(1,4,1)
	# tmp.joined_bullet(4,6,2)

# @vanishedがtrueのbulletのみ配列から削除する
#Sprite.clean(bullets)
