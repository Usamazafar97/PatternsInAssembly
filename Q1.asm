
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.data
string db "Please enter the number",'$' 
space dw 11
star dw 1
 space1 dw 1
star1 dw 13
input dw 0
downward dw 0
startToMultiply dw 2
maxSpace dw 11
 
 .code 
 mov ah,09h
mov dx,offset string
int 21h
 
mov ax,0
mov ah,01h
int 21h     
    
mov ah,0 
mov bx,0
mov bx,ax            
sub bl,48    
          
mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h
mov ah,0 


mov cx,0
mov input,bx
mov cx,bx

 outer:
 mov bx,0     
	mov bx,cx ;store
	
	mov cx,space
 k:
	mov dl,32 ;space print
	mov ah,02
	int 21h
 
 loop k
	dec space; next time decrement
	mov cx,star
 l:
	mov dl,'*' ;space stars
	mov ah,02
	int 21h
 loop l
	inc star
	inc star
	
	mov ah,02h
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
	
	mov cx,bx
 loop outer  
               
  sub input,1  
  
   mov ax,0 
  
   mov ax,input
   mov downward,ax
   mov ax,0
   mov ax,downward
   mul startToMultiply
   mov downward,ax
   sub downward,1
  
  ;idher downward = 2*input-1
  ;mov ax,0
  ;;mov ax,input
  ;mul startToMultiply 
   mov ax,0
  mov  ax,downward
  mov  star1,ax
  mov ax,0
  add space1,5
              
              
   ;space = maxSpace - input + 1 
   mov ax,0
   mov ax,input
   add ax,1
   sub maxSpace,ax 
   add maxSpace,1
   mov ax,0
   mov ax,maxSpace
   mov space1,ax
   add space1,1
   mov ax,0          
              
    
  mov cx,input
 outer1:
	mov bx,cx ;store
	
	mov cx,space1
 k1:
	mov dl,32 ;space print
	mov ah,02
	int 21h
 
 loop k1
	inc space1; next time decrement
	mov cx,star1
 l1:
	mov dl,'*' ;space stars
	mov ah,02
	int 21h
 loop l1
	dec star1 
	dec star1
	
	    mov ah,02h
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
	
	mov cx,bx
 loop outer1

ret




