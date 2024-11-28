library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity square is
	Generic (   POSX: INTEGER:= 100;
				POSY: INTEGER:= 50;
                ANCHO: INTEGER:= 20;
                X_AXIS_SET: INTEGER:=1;
                Y_AXIS_SET: INTEGER:=1); 

   Port (  HCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
           X_AXIS:  in integer range 1 to 4;
           Y_AXIS:  in integer range 1 to 4;
           HIDE:    in  STD_LOGIC;
           PAINT:   out  STD_LOGIC_VECTOR (11 downto 0););

end square;

architecture Behavioral of interface is

    begin
        interface: process(HCOUNT,VCOUNT,X_AXIS,Y_AXIS)
            
            if (HCOUNT >= POSX + 20 and HCOUNT <= (POSX+ANCHO) and VCOUNT >= POSY + 20 and VCOUNT <= (POSY+ANCHO)) then

                --se pinta de gris por defecto
                PAINT => "111111111111";
                
                -- se verifica que se encuentre en el cuadro que se requiere
                if (X_AXIS = X_AXIS_SET and Y_AXIS = Y_AXIS_SET) then
