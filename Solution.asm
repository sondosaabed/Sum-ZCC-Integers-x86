;;;;;;;;;;;;;;;; Assembly Assignemnt ;;;;;;;;;;;;;;;;   
; In this assignemnt these functionalities are done:
; 1- Sum of integers
; 2- Sum of Pos. int.
; 3- ZCC

.model small
.data
     ;;;;; Variables declaration ;;;;; 
     ;; ARRAY: store 10 integers
     ;; SUM: store int sum
     ;; P_SUM: store pos. Sum
     ;; ZCC: store zcc
     
     ARRAY db 24, 78, -6, -45, 15, 30, 7, -13, -34, -12  ;;Task a
     SUM db 0
     P_SUM db 0
     ZCC db 0    

.code
     ;;; Code section has three parts 
     ; 1- Sum of ints
     ; 2- Sum of pos. int
     ; 3- ZCC
     
     mov AX, @DATA
     mov DS, AX  
     
     
     mov BX, offset ARRAY
     
     ;;;;;;;;;;; Find SUM of integers ;;;;;;;;;;;;
     
     xor CX, CX
     
     sum_loop:
        cmp CX, 10         ;; Set the counter to 10 and compare it
        jge sum_loop_end   ;; Jump to end the loop when counter is zero
        mov AL, [BX]
        add [sum], AL
        inc CX
        inc BX             ;; Incremnt the counters
        jmp sum_loop
        
     sum_loop_end:
        xor CX, CX         ;; Resettin the counter
        xor BX, BX
        
     ;;;;;;;;;;; Find SUM of positive integers ;;;;;;;;;;;;
     
        
        pos_sum_loop:
            cmp CX, 10     ;; Counter
            jge pos_sum_loop_end
            mov AL, [BX]
            
            ;;;;;;;;; Check of Positove ;;;;;;;
            
            test AL, AL
            jns is_positive
            
            not_postive:
                jmp cont_positive_sum    
            
            is_positive:
                add [P_SUM], AL
            
            cont_positive_sum:
                inc CX
                inc BX
                jmp pos_sum_loop 
            
        pos_sum_loop_end:
            xor CX, CX         ;; Resettin the counter
            
        
        ;;;;;;;;;;; Find Zero-Crossing Count ;;;;;;;;;;;;
            
        mov CX, 9
        mov BX, offset ARRAY
        mov AL, [BX]
        inc BX
        
        zcc_loop:
            
            cmp CX, 0
            jle zcc_end_loop
            mov AH, [BX]
            mov DL, AL
            imul DX      ; mutiply and check the sign
            test AX, 8000h
            jns same_sign
            inc [ZCC]
            
            same_sign:
                
                mov AL, AH
                inc BX
                dec CX
                jmp zcc_loop
                
       zcc_end_loop:
            
            ;; Orint the sum
            ;mov SUM, AL
            ;mov AH, 2
            ;mov DL, AL
            ;int 21h
            
            mov AH, 4Ch
            int 21h        
end                     