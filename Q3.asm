
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt  


org 100h
.model small

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
;                     DATA                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.data
segmentString db   "Please enter the segment",'$' 
heightString  db   "Please enter the height",'$'
segment1      dw 0
height        dw 0
stars         dw 1
s             dw 0
sp_space      dw 0
space         dw 0
segment1Temp  dw 0 
heightTemp    dw 0
tail          dw 0
tailNew       dw 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
;                     CODE                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
 .code 
mov ah,09h
mov dx,offset segmentString  ;input segment
int 21h
 
mov ax,0
mov ah,01h
int 21h     
    

mov ah,0 

sub al,48

mov segment1,ax

 ;enter
 mov ax,0
 mov ah,02h
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 mov ah,0
 mov ax,0  

 
mov ah,09h
mov dx,offset heightString  ;input height
int 21h
 
mov ax,0
mov ah,01h
int 21h      

mov ah,0 

sub al,48

mov height,ax
 ;enter
 mov ax,0
 mov ah,02h
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 mov ah,0
 mov ax,0
 mov dx,0
 
 ;int space = (segment1 - 1)+(height - 1) 
 
mov ax,0
mov ax , segment1
mov segment1Temp , ax ;(segment1 - 1)
sub segment1Temp,1
mov ax,0 

mov ax,0
mov ax , height
mov heightTemp , ax   ;(height - 1)
sub heightTemp,1
mov ax,0  

mov bx,0
mov ax,segment1Temp
mov bx,heightTemp
add ax,bx
mov space,ax 
add space,10
mov ax,0
mov bx,0             ;space = (segment1 - 1)+(height - 1)


mov ax,0
mov ax , space
mov tail , ax ;tail = space
mov ax,0

mov ax , space
mov sp_space , ax ;sp_space = space
mov ax,0


mov cx,0
mov cx,segment1

loop1:
     push cx
     
     mov cx,0
     mov cx,height
     
     loop2:
           push cx
           
                mov cx,0
                mov cx,space
                cmp cx,0
                je idher
                loop3:
                     mov dl,' '
                     mov ah,02h
                     int 21h
                
                    loop loop3
                idher:
                mov cx,0
                mov cx,stars
                loop4:
                     mov dl,'*'
                     mov ah,02h
                     int 21h
                
                    loop loop4
                
                sub space,1
                add stars,2
                
                 ;enter
                mov ax,0
                mov ah,02h
                mov dl,0dh
                int 21h
                mov dl,0ah
                int 21h
                mov ah,0
                mov ax,0
                    
           pop cx
          loop loop2
     
     add s,3
     
     mov ax,0
     mov ax , s
     mov stars , ax ;stares = s
     mov ax,0
        
     sub sp_space,1
     
     
     mov ax,0
     mov ax , sp_space
     mov space , ax ;space = sp_space
     mov ax,0
     
     pop cx
     loop loop1
     
     mov cx,0
     mov cx,2
     loop5:
        push cx
        
        mov cx,0
        mov cx,tail
        loop6:
            
             mov dl,' '
             mov ah,02h
             int 21h
        
        
             loop loop6
         mov dl,'*'
         mov ah,02h
         int 21h
         
          ;enter
          mov ax,0
          mov ah,02h
          mov dl,0dh
          int 21h
          mov dl,0ah
          int 21h
          mov ah,0
          mov ax,0
         
         pop cx
         loop loop5
         
      mov ax,0
      mov ax , tail
      mov tailNew , ax ;tailNew = tail       
      sub tailNew,3
      mov ax,0
           
      mov cx,0
      mov cx,tailNew
      loop7:
            
          mov dl,' '
          mov ah,02h
          int 21h
        
        
          loop loop7  
      mov cx,0
      mov cx,7
      loop8:
            
          mov dl,'*'
          mov ah,02h
          int 21h        
        
          loop loop8
     
          
ret




