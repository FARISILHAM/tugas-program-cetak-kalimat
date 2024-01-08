.MODEL SMALL
.CODE
ORG 100H
   
AWAL:    
    MOV CL,30H                                    
    JMP PROSES
    KAL0 DB 'Ketikkan satu kalimat:$'
    KAL1 DB 13,10,'Kalimat yang diinput adalah:$'
    KAL2 DB 13,10,'Cetak dari belakang:$',13,10  
    KAL3 DB 13,10,'panjang string adalah:$' 
    KALX DB 13,10,'$'
    KAL4 DB 13,10,'Jumlah Huruf Vokal:$'  
    KAL5 DB 13,10,'Jumlah Huruf Konsonan:$'
    KATA DB 20,?,20 DUP (?)                   
    
    
VOKAL:  INC CL                    
        JMP PLUS                        
        

                          
PROSES:            
    ;============= CETAK STRING ================
    
    MOV AH,09H
    MOV DX,OFFSET KAL0
    INT 21H  
    
    
    ;============= INPUT STRING ================
    
    MOV AH,0AH
    LEA DX,KATA
    INT 21H
    
    ;============= CETAK STRING ================
    
    MOV AH,09H
    MOV DX,OFFSET KAL1
    INT 21H
    
    ;============ CETAK VARIABEL STRING DG MODEL COMPARASI ==========
    
    MOV BX,OFFSET KATA+2        
    
    
CETAK:
    MOV DL,[BX]                    
    CMP DL,0DH                    
    JE BELAKANG                    
        
    MOV AH,02H
    INT 21H
    
        CMP DL,'a'
        JE VOKAL   
        CMP DL,'i'
        JE VOKAL
        CMP DL,'u'
        JE VOKAL
        CMP DL,'e'
        JE VOKAL
        CMP DL,'o'
        JE VOKAL
        CMP DL,'A'
        JE VOKAL
        CMP DL,'I'
        JE VOKAL
        CMP DL,'U'
        JE VOKAL
        CMP DL,'E'
        JE VOKAL
        CMP DL,'O'
        JE VOKAL 
        
PLUS:INC BX
     JMP CETAK    
   
    ;============= CETAK KATA DARI BELAKANG ==================

BELAKANG:MOV AH,09H
         MOV DX,OFFSET KAL2
         INT 21H   
         MOV AH,09H
         MOV DX,OFFSET KALX            
         INT 21H                     

CETAK1:    
    MOV DL,[BX]                    
    CMP DL,KATA+1                
    JE VOKAL1                   
                     
    MOV AH,02H    
    INT 21H
    DEC BX
    JMP CETAK1
      
            
    ;============ CETAK JUMLAH VOKAL ================
    
VOKAL1:
    MOV AH,09H
    MOV DX,OFFSET KAL4
    INT 21H
    
    MOV DL,CL
    ;ADD DL,30H
    MOV AH,02H
    INT 21H 
    
                   
    ;============ CETAK JUMLAH KONSONAN ===============
    
KONSONAN:
    MOV AH,09H
    MOV DX,OFFSET KAL5
    INT 21H
   
    MOV BX,OFFSET KATA+1        
    MOV DL,[BX]                 
    ADD DL,30H                    
    SUB DL,CL                    
    ADD DL,30H                    
    MOV AH,02H
    INT 21H  
    
    
    ;============= CETAK PANJANG STRING ================
    
AKHIR:
    MOV AH,09H
    MOV DX,OFFSET KAL3
    INT 21H
    
    MOV BX,OFFSET KATA+1
    MOV DL,[BX]
    ADD DL,30H
    MOV AH,02H
    INT 21H  
            
SELESAI:
    INT 20H
    
END AWAL