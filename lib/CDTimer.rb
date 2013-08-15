# coding: UTF-8
require 'dxruby'

class CDTimer < Font

	attr_accessor :min, :sec

	def initialize(font_size)
		super(font_size)
		@limit_time = 3 * 60
		@start_time = Time.now
		@min = 0
		@sec = 0
	end

	def reload
		now_time = Time.now
		diff_time = now_time - @start_time
		countdown = (@limit_time - diff_time).to_i
		@min = countdown / 60
		@sec = countdown % 60
    #行頭0つける
    @min = format("%02d",@min)
    @sec = format("%02d",@sec)
    @min = @min.to_s
    @sec = @sec.to_s

	end
end
