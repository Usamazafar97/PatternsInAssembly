
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt  


org 100h
.model small

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
;                     DATA                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.data
string db "Please enter the number",'$'
spaces dw 0
stars dw 0
rows dw 5
spaces2 dw 0 
forLoop dw 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
;                     CODE                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
 .code 
mov ah,09h
mov dx,offset string
int 21h
 
mov ax,0
mov ah,01h
int 21h     
    
mov dl,al
mov ah,02h
int 21h 
mov dx,0
mov ah,0 

sub al,48

mov rows,ax 


 mov ax,0
 mov ah,02h
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 mov ah,0
 mov ax,0


;spaces = rows -1
mov ax,0
mov ax , rows
mov spaces , ax
sub spaces,1 
mov ax,0

;forLoop = rows * 2
;First forLoop = rows
;then forLoop = forLoop * 2

mov ax,0
mov ax , rows
mov forLoop , ax
add forLoop , ax 
mov ax,0 

;Now  forLoop = 2*rows

mov cx,0
mov cx,forLoop 
outerLoop:
         push cx  
                
         ;if(cx < rows)
         cmp cx,rows
         jbe if
         ja else
         jmp khatam
         
         else:
            mov cx,0
            mov cx,spaces
            cmp cx,0
            je toBhiIdher
            loop1:                   
                  
                mov dl,' '
                mov ah,02h
                int 21h
                mov ax,0 
                  loop loop1
                toBhiIdher:
                mov dl,'*'
                mov ah,02h
                int 21h
             mov ax,0
             mov cx,0
             mov cx,spaces2
             cmp cx,0
             je idher
             loop2:
                   
                  
                mov dl,' '
                mov ah,02h
                int 21h
                mov ax,0 
                  loop loop2
                idher:
                mov dl,'*'
                mov ah,02h
                int 21h
                
                
                
            sub spaces,1
            add spaces2,2
            
            ;for enter
                mov ax,0
                mov ah,02h
                mov dl,0dh
                int 21h
                mov dl,0ah
                int 21h
                mov ah,0
                mov ax,0         
            jmp aage
            
         
         if: 
         
            add spaces,1
            sub spaces2,2
           
            mov cx,0
            mov cx,spaces
            cmp cx,0
            je toBhiIdher1
            loop3:                   
                  
                mov dl,' '
                mov ah,02h
                int 21h
                mov ax,0 
                  loop loop3
                toBhiIdher1:
                mov dl,'*'
                mov ah,02h
                int 21h
             mov ax,0
             mov cx,0
             mov cx,spaces2
             cmp cx,0
             je idher1
             loop4:
                   
                  
                mov dl,' '
                mov ah,02h
                int 21h
                mov ax,0 
                  loop loop4
                idher1:
                mov dl,'*'
                mov ah,02h
                int 21h
            ;for enter
                mov ax,0
                mov ah,02h
                mov dl,0dh
                int 21h
                mov dl,0ah
                int 21h
                mov ah,0
                mov ax,0         
            jmp aage    
         aage:   
            pop cx 
            loop outerLoop
            jmp khatam
         
            
khatam:
    mov ah,4ch
    int 21h         

ret




