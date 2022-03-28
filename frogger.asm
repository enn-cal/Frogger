#####################################################################
#
# CSC258H1S Winter 2022 Assembly Final Project
# University of Toronto, St. George
#
# Student: Nehchal Kalsi, 1006884105
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 512
# - Display height in pixels: 512
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################

.data
	displayAddress: .word 0x10008000
	grass_color: .word 0x00ff00
	
	x_frog_initial: .word 256
	y_frog_initial: .word 102
	
	x_frog: .word 64
	y_frog: .word 102
.text

main:	
	# initialize loop variables
	lw $t0, displayAddress 
	
	li $t2, 0x2d8043		# grass color
	li $t3, 0x83e4eb		# water color
	li $t4, 0x373f40		# road color
	
	add $t5, $zero, $zero	# set $t5 to zero
	addi $t6, $zero, 128 	# set $t6 to zero
	
draw_background:
	beq $t5, $t6, end_draw_background
	
	# Upper Grass
	sw $t2, 6144($t0)
	sw $t2, 6656($t0)
	sw $t2, 7168($t0)
	sw $t2, 7680($t0)
	sw $t2, 8192($t0)
	sw $t2, 8704($t0)
	sw $t2, 9216($t0)
	sw $t2, 9728($t0)
	sw $t2, 10240($t0)
		
	# Water
	sw $t3, 10752($t0)
	sw $t3, 11264($t0)
	sw $t3, 11776($t0)
	sw $t3, 12288($t0)
	sw $t3, 12800($t0)
	sw $t3, 13312($t0)
	sw $t3, 13824($t0)
	sw $t3, 14336($t0)
	sw $t3, 14848($t0)
	
	sw $t3, 15360($t0)
	sw $t3, 15872($t0)
	sw $t3, 16384($t0)
	sw $t3, 16896($t0)
	sw $t3, 17408($t0)
	sw $t3, 17920($t0)
	sw $t3, 18432($t0)
	sw $t3, 18944($t0)
	sw $t3, 19456($t0)
	
	sw $t3, 19968($t0)
	sw $t3, 20480($t0)
	sw $t3, 20992($t0)
	sw $t3, 21504($t0)
	sw $t3, 22016($t0)
	sw $t3, 22528($t0)
	sw $t3, 23040($t0)
	sw $t3, 23552($t0)
	sw $t3, 24064($t0)
	
	sw $t3, 24576($t0)
	sw $t3, 25088($t0)
	sw $t3, 25600($t0)
	sw $t3, 26112($t0)
	sw $t3, 26624($t0)
	sw $t3, 27136($t0)
	sw $t3, 27648($t0)
	sw $t3, 28160($t0)
	sw $t3, 28672($t0)
		
	# Middle Grass
	sw $t2, 29184($t0)
	sw $t2, 29696($t0)
	sw $t2, 30208($t0)
	sw $t2, 30720($t0)
	sw $t2, 31232($t0)
	sw $t2, 31744($t0)
	sw $t2, 32256($t0)
	sw $t2, 32768($t0)
	sw $t2, 33280($t0)
	
	# Road	
	sw $t4, 33792($t0)
	sw $t4, 34304($t0)
	sw $t4, 34816($t0)
	sw $t4, 35328($t0)
	sw $t4, 35840($t0)
	sw $t4, 36352($t0)	
	sw $t4, 36864($t0)
	sw $t4, 37376($t0)
	sw $t4, 37888($t0)
	
	sw $t4, 38400($t0)
	sw $t4, 38912($t0)
	sw $t4, 39424($t0)
	sw $t4, 39936($t0)
	sw $t4, 40448($t0)
	sw $t4, 40960($t0)
	sw $t4, 41472($t0)
	sw $t4, 41984($t0)
	sw $t4, 42496($t0)
	
	sw $t4, 43008($t0)
	sw $t4, 43520($t0)
	sw $t4, 44032($t0)
	sw $t4, 44544($t0)
	sw $t4, 45056($t0)
	sw $t4, 45568($t0)
	sw $t4, 46080($t0)
	sw $t4, 46592($t0)
	sw $t4, 47104($t0)
	
	sw $t4, 47616($t0)
	sw $t4, 48128($t0)
	sw $t4, 48640($t0)
	sw $t4, 49152($t0)
	sw $t4, 49664($t0)
	sw $t4, 50176($t0)
	sw $t4, 50688($t0)
	sw $t4, 51200($t0)
	sw $t4, 51712($t0)
	
	# Lower Grass
	sw $t2, 52224($t0)
	sw $t2, 52736($t0)
	sw $t2, 53248($t0)
	sw $t2, 53760($t0)
	sw $t2, 54272($t0)
	sw $t2, 54784($t0)
	sw $t2, 55296($t0)
	sw $t2, 55808($t0)
	sw $t2, 56320($t0)
	
	addi $t0, $t0, 4		# move to pixel to the right
		
	addi $t5, $t5, 1		# increment the loop var
	
	j draw_background	# jump to the top of the func
	
end_draw_background:	
	li $t0, 0x10008000

draw_frog:
	li $t1, 0x9dff00		# frog color

	# front limbs
	sw $t1, 52456($t0)
	sw $t1, 52460($t0)	
	sw $t1, 52484($t0)
	sw $t1, 52488($t0)
	
	sw $t1, 52968($t0)
	sw $t1, 52972($t0)	
	sw $t1, 52996($t0)
	sw $t1, 53000($t0)
	
	# head
	sw $t1, 53480($t0)
	sw $t1, 53484($t0)
	sw $t1, 53488($t0)
	sw $t1, 53492($t0)	
	sw $t1, 53496($t0)
	sw $t1, 53500($t0)
	sw $t1, 53504($t0)	
	sw $t1, 53508($t0)
	sw $t1, 53512($t0)
	
	sw $t1, 53992($t0)
	sw $t1, 53996($t0)
	sw $t1, 54000($t0)
	sw $t1, 54004($t0)	
	sw $t1, 54008($t0)
	sw $t1, 54012($t0)
	sw $t1, 54016($t0)	
	sw $t1, 54020($t0)
	sw $t1, 54024($t0)
	
	# torso
	sw $t1, 54512($t0)
	sw $t1, 54516($t0)
	sw $t1, 54520($t0)
	sw $t1, 54524($t0)	
	sw $t1, 54528($t0)
	
	sw $t1, 55024($t0)
	sw $t1, 55028($t0)
	sw $t1, 55032($t0)
	sw $t1, 55036($t0)
	sw $t1, 55040($t0)
	
	# lower body
	sw $t1, 55528($t0)
	sw $t1, 55532($t0)
	sw $t1, 55536($t0)
	sw $t1, 55540($t0)	
	sw $t1, 55544($t0)
	sw $t1, 55548($t0)
	sw $t1, 55552($t0)	
	sw $t1, 55556($t0)
	sw $t1, 55560($t0)
	
	sw $t1, 56040($t0)
	sw $t1, 56044($t0)
	sw $t1, 56048($t0)
	sw $t1, 56052($t0)	
	sw $t1, 56056($t0)
	sw $t1, 56060($t0)
	sw $t1, 56064($t0)	
	sw $t1, 56068($t0)
	sw $t1, 56072($t0)
	
	sw $t1, 56552($t0)
	sw $t1, 56556($t0)
	sw $t1, 56560($t0)	
	sw $t1, 56564($t0)
	sw $t1, 56568($t0)
	sw $t1, 56572($t0)
	sw $t1, 56576($t0)	
	sw $t1, 56580($t0)
	sw $t1, 56584($t0)
	
add $t5, $zero, $zero
	
draw_goals:
	beq $t5, 11, end_goals
	
	sw $t4, 6176($t0)
	sw $t4, 6688($t0)
	sw $t4, 7200($t0)
	sw $t4, 7712($t0)
	sw $t4, 8224($t0)
	sw $t4, 8736($t0)
	sw $t4, 9248($t0)
	sw $t4, 9760($t0)
	sw $t4, 10272($t0)
	
	sw $t4, 6376($t0)
	sw $t4, 6888($t0)
	sw $t4, 7400($t0)
	sw $t4, 7912($t0)
	sw $t4, 8424($t0)
	sw $t4, 8936($t0)
	sw $t4, 9448($t0)
	sw $t4, 9960($t0)
	sw $t4, 10472($t0)
	
	sw $t4, 6576($t0)
	sw $t4, 7088($t0)
	sw $t4, 7600($t0)
	sw $t4, 8112($t0)
	sw $t4, 8624($t0)
	sw $t4, 9136($t0)
	sw $t4, 9648($t0)
	sw $t4, 10160($t0)
	sw $t4, 10672($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_goals
	
end_goals:
	li $t0, 0x10008000 
	add $t5, $zero, $zero

li $t4, 0x805d2d		# log color
draw_water_lane_1:
	beq $t5, 15, end_water_lane_1
	
	sw $t4, 10784($t0)
	sw $t4, 11296($t0)
	sw $t4, 11808($t0)
	sw $t4, 12320($t0)
	sw $t4, 12832($t0)
	sw $t4, 13344($t0)
	sw $t4, 13856($t0)
	sw $t4, 14368($t0)
	sw $t4, 14880($t0)
	
	sw $t4, 10944($t0)
	sw $t4, 11456($t0)
	sw $t4, 11968($t0)
	sw $t4, 12480($t0)
	sw $t4, 12992($t0)
	sw $t4, 13504($t0)
	sw $t4, 14016($t0)
	sw $t4, 14528($t0)
	sw $t4, 15040($t0)
	
	sw $t4, 11184($t0)
	sw $t4, 11696($t0)
	sw $t4, 12208($t0)
	sw $t4, 12720($t0)
	sw $t4, 13232($t0)
	sw $t4, 13744($t0)
	sw $t4, 14256($t0)
	sw $t4, 14768($t0)
	sw $t4, 15280($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_water_lane_1
	
end_water_lane_1:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
	
li $t4, 0x5b24a3		# turtle color
draw_water_lane_2:
	beq $t5, 20, end_water_lane_2
	
	sw $t4, 15512($t0)
	sw $t4, 16024($t0)
	sw $t4, 16536($t0)
	sw $t4, 17048($t0)
	sw $t4, 17560($t0)
	sw $t4, 18072($t0)
	sw $t4, 18584($t0)
	sw $t4, 19096($t0)
	sw $t4, 19608($t0)
	
	sw $t4, 15712($t0)
	sw $t4, 16224($t0)
	sw $t4, 16736($t0)
	sw $t4, 17248($t0)
	sw $t4, 17760($t0)
	sw $t4, 18272($t0)
	sw $t4, 18784($t0)
	sw $t4, 19296($t0)
	sw $t4, 19808($t0)
	
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_water_lane_2
	
end_water_lane_2:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	

li $t4, 0x805d2d		# log color
draw_water_lane_3:
	beq $t5, 40, end_water_lane_3
	
	sw $t4, 19968($t0)
	sw $t4, 20480($t0)
	sw $t4, 20992($t0)
	sw $t4, 21504($t0)
	sw $t4, 22016($t0)
	sw $t4, 22528($t0)
	sw $t4, 23040($t0)
	sw $t4, 23552($t0)
	sw $t4, 24064($t0)
	
	sw $t4, 20268($t0)
	sw $t4, 20780($t0)
	sw $t4, 21292($t0)
	sw $t4, 21804($t0)
	sw $t4, 22316($t0)
	sw $t4, 22828($t0)
	sw $t4, 23340($t0)
	sw $t4, 23852($t0)
	sw $t4, 24364($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_water_lane_3
	
end_water_lane_3:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
li $t4, 0x5b24a3		# turtle color
draw_water_lane_4:
	beq $t5, 25, end_water_lane_4
	
	sw $t4, 24628($t0)
	sw $t4, 25140($t0)
	sw $t4, 25652($t0)
	sw $t4, 26164($t0)
	sw $t4, 26676($t0)
	sw $t4, 27188($t0)
	sw $t4, 27700($t0)
	sw $t4, 28212($t0)
	sw $t4, 28724($t0)
	
	sw $t4, 24828($t0)
	sw $t4, 25340($t0)
	sw $t4, 25852($t0)
	sw $t4, 26364($t0)
	sw $t4, 26876($t0)
	sw $t4, 27388($t0)
	sw $t4, 27900($t0)
	sw $t4, 28412($t0)
	sw $t4, 28924($t0)
	
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_water_lane_4
	
end_water_lane_4:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
li $t4, 0xeb0909		# red color
draw_road_lane_1:
	beq $t5, 25, end_road_lane_1
	
	sw $t4, 33824($t0)
	sw $t4, 34336($t0)
	sw $t4, 34848($t0)
	sw $t4, 35360($t0)
	sw $t4, 35872($t0)
	sw $t4, 36384($t0)
	sw $t4, 36896($t0)
	sw $t4, 37408($t0)
	sw $t4, 37920($t0)
	
	sw $t4, 34124($t0)
	sw $t4, 34636($t0)
	sw $t4, 35148($t0)
	sw $t4, 35660($t0)
	sw $t4, 36172($t0)
	sw $t4, 36684($t0)
	sw $t4, 37196($t0)
	sw $t4, 37708($t0)
	sw $t4, 38220($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_road_lane_1
	
end_road_lane_1:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
	
li $t4, 0xe36724		# rust color
draw_road_lane_2:
	beq $t5, 10, end_road_lane_2
	
	sw $t4, 38552($t0)
	sw $t4, 39064($t0)
	sw $t4, 39576($t0)
	sw $t4, 40088($t0)
	sw $t4, 40600($t0)
	sw $t4, 41112($t0)
	sw $t4, 41624($t0)
	sw $t4, 42136($t0)
	sw $t4, 42648($t0)
	
	sw $t4, 38652($t0)
	sw $t4, 39164($t0)
	sw $t4, 39676($t0)
	sw $t4, 40188($t0)
	sw $t4, 40700($t0)
	sw $t4, 41212($t0)
	sw $t4, 41724($t0)
	sw $t4, 42236($t0)
	sw $t4, 42748($t0)
	
	sw $t4, 38852($t0)
	sw $t4, 39364($t0)
	sw $t4, 39876($t0)
	sw $t4, 40388($t0)
	sw $t4, 40900($t0)
	sw $t4, 41412($t0)
	sw $t4, 41924($t0)
	sw $t4, 42436($t0)
	sw $t4, 42948($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_road_lane_2
	
end_road_lane_2:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	

li $t4, 0x3c71a6		# navy color
draw_road_lane_3:
	beq $t5, 40, end_road_lane_3
	
	sw $t4, 43008($t0)
	sw $t4, 43520($t0)
	sw $t4, 44032($t0)
	sw $t4, 44544($t0)
	sw $t4, 45056($t0)
	sw $t4, 45568($t0)
	sw $t4, 46080($t0)
	sw $t4, 46592($t0)
	sw $t4, 47104($t0)
	
	sw $t4, 43308($t0)
	sw $t4, 43820($t0)
	sw $t4, 44332($t0)
	sw $t4, 44844($t0)
	sw $t4, 45356($t0)
	sw $t4, 45868($t0)
	sw $t4, 46380($t0)
	sw $t4, 46892($t0)
	sw $t4, 47404($t0)
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_road_lane_3
	
end_road_lane_3:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
li $t4, 0xcae324		# neon geen color
draw_road_lane_4:
	beq $t5, 30, end_road_lane_4
	
	sw $t4, 47668($t0)
	sw $t4, 48180($t0)
	sw $t4, 48692($t0)
	sw $t4, 49204($t0)
	sw $t4, 49716($t0)
	sw $t4, 50228($t0)
	sw $t4, 50740($t0)
	sw $t4, 51252($t0)
	sw $t4, 51764($t0)
	
	sw $t4, 47968($t0)
	sw $t4, 48480($t0)
	sw $t4, 48992($t0)
	sw $t4, 49504($t0)
	sw $t4, 50016($t0)
	sw $t4, 50528($t0)
	sw $t4, 51040($t0)
	sw $t4, 51552($t0)
	sw $t4, 52064($t0)
	
	
	addi $t5, $t5, 1
	add $t0, $t0, 4
	j draw_road_lane_4
	
end_road_lane_4:
	li $t0, 0x10008000 
	add $t5, $zero, $zero
	
	
redraw_all:
	li $v0, 32
	li $a0, 16		
	syscall
	j main