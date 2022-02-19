.data
arr: .asciiz "0123456789"
MSG0: .asciiz "\n*               Hello Professor and Friend. Would you like to play Tic Tac Toe?                       * \n"
MSG1: .asciiz "\n*                                 Welcome to Tic Tac Toe ^-^                                          *  \n"        
MSG11: .asciiz"*******************************************************************************************************\n"
MSG12: .asciiz"*                 TIC TAC TOE created by Minh Thu                                                     *\n"
MSG13: .asciiz"*    RULES:                                                                                           *\n"
MSG14: .asciiz"* Player 1 : play with X sign and go first.                                                           *\n"
MSG15: .asciiz"* Player 2 : play with O sign and go after.                                     .                     *\n"
MSG16: .asciiz"* Enter the number that stand for index of each cell in the board to choose where you want to move    *\n"
MSG17: .asciiz"* You need at least 3 signs of yours in the same column/row/diagonal to win this game                 *\n"
MSG18: .asciiz"*                                    GOOD LUCK TO BOTH OF YOU                                         *\n"                                                    
MSG2: .asciiz "\nPlayer 1, enter a number of an empty space: "
MSG3: .asciiz "\nPlayer 2, enter a number of an empty space: "
MSG4: .asciiz "\nSquare number is below 1!!! Please enter number in [1,9]!!!\n"
MSG5: .asciiz "\nsquare number is above 9!!! Please enter number in [1,9]!!!\n"
MSG55: .asciiz "\nCell was occupied!!! Please enter other empty place!!!\n"
MSG6: .asciiz "\n Tie Game\n "
MSG7:  .asciiz "\n The winner is : "
MSG8: .asciiz " Player 1 (X). Congratuations!!! \n\n Wish you luck next time, Player 2!!"
MSG9: .asciiz " Player 2 (O). Congratuations!!! \n\n Wish you luck next time, Player 1!!"
CROSS: .asciiz "\n-----\n"

BAR: .byte '|'
X: .byte'X'
O: .byte'O'
EOL: .byte'\n'

.text
.globl main
main:

#GREETING 

	li $v0,4
	la $a0,MSG11
	syscall
	li $v0,4
	la $a0,MSG0
	syscall
	li $v0,4
	la $a0,MSG1
	syscall
	li $v0,4
	la $a0,MSG11
	syscall
	li $v0,4
	la $a0,MSG11
	syscall
	li $v0,4
	la $a0,MSG12
	syscall
	li $v0,4
	la $a0,MSG13
	syscall
	li $v0,4
	la $a0,MSG14
	syscall
	li $v0,4
	la $a0,MSG15
	syscall
	li $v0,4
	la $a0,MSG16
	syscall
	li $v0,4
	la $a0,MSG17
	syscall
	li $v0,4
	la $a0,MSG18
	syscall
	li $v0,4
	la $a0,MSG11
	syscall

#Print the board  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#1ST Player First Move    (1) 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP1
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t0,X               
	sb $t0,0($v0)

#Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

# 2RD Player First Move     (2)   

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP2
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t1,O
	sb $t1,0($v0)

# Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

# 1ST Player Second Move      (3) 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP1
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t0,X
	sb $t0,0($v0)

#Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

# 2RD Player Second Move     (4)  
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP2
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t1,O
	sb $t1,0($v0)

#Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#1ST Player Third Move      (5)  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP1
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t0,X
	sb $t0,0($v0)

#Print the board  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#Check For WInner  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal WIN
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0, W

#2RD Player Third Move     (6)

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP2
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t1,O
	sb $t1,0($v0)

# Print the board   

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#Check For WInner   

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal WIN
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0, W

#            1ST Player Fourth Move      (7)   

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP1
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t0,X
	sb $t0,0($v0)

# Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#Check For WInner  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal WIN
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0, W

#2RD Player Fourth Move     (8)

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP2
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t1,O
	sb $t1,0($v0)

#Print the board  

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#Check For WInner   

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal WIN
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0, W

#1ST Player Fifth Move      (9)    

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal MOP1
	lw $ra,4($sp)
	addiu $sp,$sp,4
	lb $t0,X
	sb $t0,0($v0)

# Print the board 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal PRINT
	lw $ra,4($sp)
	addiu $sp,$sp,4

#Check For WInner 

	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal WIN
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0, W
##############################################
#	    If Both not win                  #
#############################################
T:	li $v0,4
	la $a0,MSG6
	syscall
	j END
#############################################
#	ANNOUNCE THE WINNING RESULT         #
############################################
W:	move $t0,$v0
	li $v0,4
	la $a0, MSG7
	syscall
	lb $t2,O
	beq $t2,$t0,P2
	j P1
P1:
	la $a0,MSG8
	syscall
	j END

P2:
	la $a0,MSG9
	syscall
	j END

############################################
#	Print The Tic Tac Toe Board        #
###########################################
PRINT:
	la $t0,arr
	lb $a0,1($t0)            
	li $v0,11
	syscall
	lb $a0,BAR
	syscall
	lb $a0,2($t0)
	syscall
	lb $a0,BAR
	syscall
	lb $a0,3($t0)
	syscall
	la $a0,CROSS
	li $v0,4
	syscall
	lb $a0,4($t0)
	li $v0,11
	syscall
	lb $a0,BAR
	syscall
	lb $a0,5($t0)
	syscall
	lb $a0,BAR
	syscall
	lb $a0,6($t0)
	syscall
	la $a0,CROSS
	li $v0,4
	syscall
	lb $a0,7($t0)
	li $v0,11
	syscall
	lb $a0,BAR
	syscall
	lb $a0,8($t0)
	syscall
	lb $a0,BAR
	syscall
	lb $a0,9($t0)
	syscall
	lb $a0,EOL          #/n
	syscall
	jr $ra
############################################
#	Player 1 MOVE                      #
###########################################
MOP1:
	la $a0, MSG2
	li $v0,4
	syscall
	li $v0,5
	syscall
	li $t1,1
	blt $v0,$t1,LT11       #Less than 1
	li $t1,9
	bgt $v0,$t1,GT91       #Greater than 9
	la $t0,arr
	add $a0,$t0,$v0        #Access the place player want to stick
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal CHECKOCP           #Check opcupied
	lw $ra, 4($sp)
	addiu $sp,$sp,4
	beqz $v0,PO             # Print attention OPCUPIED
	jr $ra
PO:	
	move $t4,$a0
	li $v0,4
	la $a0,MSG55
	syscall
	li $v0,0
	move $a0,$t4
	j MOP1

LT11:
	la $a0, MSG4
	li $v0,4
	syscall
	j MOP1
GT91:
	la $a0,MSG5
	li $v0,4
	syscall
	j MOP1
############################################
#	Player 2 MOVE                      #
###########################################
MOP2:
	la $a0, MSG3
	li $v0,4
	syscall
	li $v0,5
	syscall
	li $t1,1
	blt $v0,$t1,LT1
	li $t1,9
	bgt $v0,$t1,GT9
	la $t0,arr
	add $a0,$t0,$v0			#store the address of index to $a0 to check occupied
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal CHECKOCP
	lw $ra, 4($sp)
	addiu $sp,$sp,4
	beqz $v0,PO2
	jr $ra
PO2:	
	move $t4,$a0
	li $v0,4
	la $a0,MSG55
	syscall
	li $v0,0
	move $a0,$t4
	j MOP2

LT1:
	la $a0, MSG4
	li $v0,4
	syscall
	j MOP2
GT9:
	la $a0,MSG5
	li $v0,4
	syscall
	j MOP2
############################################
#	CHECK OCCUPIED                     #
###########################################
CHECKOCP:
	li $v0,0
	lb $t0,X
	lb $t1,0($a0)
	beq $t0,$t1,NOK
	lb $t0,O
	beq $t0,$t1,NOK
	move $v0,$a0
NOK:
	jr $ra
############################################
#	CHECK WIN                          #
###########################################
WIN:
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal ROWS
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0,WINNER
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal COLS
	lw $ra,4($sp)
	addiu $sp,$sp,4
	bnez $v0,WINNER
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	jal DIAG
	lw $ra,4($sp)
	addiu $sp,$sp,4
WINNER:
	jr $ra
############################################
#	CHECK WIN  BY ROW                  #
###########################################	
ROWS:
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	li $a0,1
	jal ROW               #check detail first row           
	bnez $v0, ROWW
	li $a0,2
	jal ROW               #check detail second row   
	bnez $v0, ROWW
	li $a0,3
	jal ROW               #check detail third row   
	bnez $v0,ROWW
	li $v0,0
ROWW:
	lw $ra,4($sp)
	addiu $sp,$sp,4
	jr $ra
############################################
#	CHECK DETAIL                       #
###########################################
ROW:
	li $v0,0
	addiu, $a0,$a0,-1
	li $t0,3
	mul $t0, $t0,$a0
	la $t1,arr                    #t1=0   
	addi $t1,$t1,1                #t1=1
	add $t1,$t1,$t0               # t1= t1 + (ô cot 1 -1)*3 : X or O or maybe number.**
	lb $t2,0($t1)                # t2 is one of them : 1,4,7
	lb $t3,1($t1)                # t3 is one of them:  2,5,8
	bne $t2,$t3,ROWN             
	lb $t3,2($t1)                #t3 is one of them: 3,6,9
	bne $t2,$t3,ROWN
	move $v0,$t1
ROWN:
	jr $ra
############################################
#	CHECK WIN  BY COL                  #
###########################################	
COLS:
	addiu $sp,$sp,-4
	sw $ra,4($sp)
	li $a0,1                       #check detail first col
	jal COL
	bnez $v0, COLW
	li $a0,2
	jal COL
	bnez $v0, COLW
	li $a0,3
	jal COL
	bnez $v0,COLW
	li $v0,0
COLW:
	lw $ra,4($sp)
	addiu $sp,$sp,4
	jr $ra
############################################
#	CHECK DETAIL                       #
###########################################
COL:
	li $v0,0
	la $t0,arr                      #t0 base address of arr
	add $t0,$t0,$a0                 #get to the cell in the col in the first row
	
	lb $t1,0($t0)                   #load from cell in the col in the first row
	lb $t2,3($t0)                   #load from cell in the col in the second row
	lb $t3,6($t0)                   #load from cell in the col in the third row
	li $v0,0
	
	bne $t1,$t2,COLN
	bne $t1,$t3,COLN
	move $v0,$t1
COLN:
	jr $ra
############################################
#	CHECK WIN  BY DIGONAL CELL         #
###########################################		
DIAG:
	li $v0,0
	la $t0,arr
	lb $t1,1($t0)
	lb $t2,5($t0)
	lb $t3,9($t0)	
	bne $t1,$t2,DIAG2
	bne $t1,$t3,DIAG2
	move $v0,$t1
	jr   $ra
DIAG2:
	lb $t1,3($t0)
	lb $t2,5($t0)
	lb $t3,7($t0)	
	bne $t1,$t2,DIAGN
	bne $t1,$t3,DIAGN
	move $v0,$t1
DIAGN:
	jr $ra
############################################
#	END                                #
###########################################	
END:
	li	$v0, 10			
	syscall
	
	

	
