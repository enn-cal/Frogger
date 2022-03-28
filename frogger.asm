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
.text
	# initialize loop variables
	lw $t0, displayAddress 
	add $t5, $zero, $zero	# set $t5 to zero
	addi $t6, $zero, 128 	# set $t6 to zero
	li $t2, 0x2d8043		# grass color
	li $t3, 0x83e4eb		# water color
	li $t4, 0x373f40		# road color
	li $t7, 0x9dff00		# frog color
	
draw_background:
	beq $t5, $t6, Exit
	
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
	
	
Exit:
	li $v0, 10		# terminate the program gracefully
	syscall
