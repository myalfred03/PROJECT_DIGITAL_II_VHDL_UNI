



library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;  
--DECLARACION DE ENTRADAS Y SALIDAS 
entity ContadorBCD is 
    Port ( MHZ50 	: in  STD_LOGIC;	--RELOJ INTERNO DE LA TARJETA 50MHZ      ( CLK  )
     	     PULSO  : IN STD_LOGIC;	--AYUDA A LA DETECCI�N DE PULSOS  ( pulso de entrada  )
			  SALIDA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    	     R  		: IN STD_LOGIC		--RESET  (  clr  )
);
end ContadorBCD; 
 
architecture Behavioral of ContadorBCD is  
--DECLARACION DE SE�ALES INTERNAS A USARSE 
	  
	 
	  SIGNAL APULSO:STD_LOGIC; 
	  SIGNAL CONTADOR: STD_LOGIC_VECTOR(15 DOWNTO 0) :=X"0000";  
begin   


-- DETECCI�N FLANCO POSITIVO 
APULSO <= PULSO WHEN MHZ50'EVENT AND MHZ50='1'; 
     
-- CONTADOR DE PULSOS 
CONTADOR<= X"0000"  WHEN R='1' ELSE 
           CONTADOR+1 WHEN APULSO='0' AND PULSO='1' AND MHZ50'EVENT AND MHZ50='1';       
 
SALIDA <= CONTADOR;
  
end Behavioral; 