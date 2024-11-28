library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity interface is
	Generic (   POSX: INTEGER:= 100;
				POSY: INTEGER:= 50;
                ANCHO: INTEGER:= 20;
                X_AXIS: INTEGER:=1;
                Y_AXIS: INTEGER:=1); 

   Port (  HCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
           X_AXIS:  in integer range 1 to 4;
           Y_AXIS:  in integer range 1 to 4;
           VALUE:   in  STD_LOGIC_VECTOR (3 downto 0);
           PAINT:   out  STD_LOGIC);
end interface;

architecture Behavioral of interface is

    begin
        interface: process(HCOUNT,VCOUNT,X_AXIS,Y_AXIS)
            -- CUADRO 1,1
            if (HCOUNT >= POSX + 20 and HCOUNT <= (POSX+ANCHO) and VCOUNT >= POSY + 20 and VCOUNT <= (POSY+ANCHO)) then
                if (X_AXIS = 1 and Y_AXIS = 1) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 1,2
            if (HCOUNT >= POSX + 20 and HCOUNT <= (POSX+ANCHO) and VCOUNT >= POSY + 20*2 + ANCHO*2 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 1 and Y_AXIS = 2) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 1,3
            if (HCOUNT >= POSX + 20 and HCOUNT <= (POSX+ANCHO) and VCOUNT >= POSY + 20*3 + ANCHO*3 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 1 and Y_AXIS = 3) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 1,4
            if (HCOUNT >= POSX + 20 and HCOUNT <= (POSX+ANCHO) and VCOUNT >= POSY + 20*4 + ANCHO*4 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 1 and Y_AXIS = 4) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 2,1
            if (HCOUNT >= POSX + 20*2 + ANCHO*2 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20 and VCOUNT <= (POSY+ANCHO)) then
                if (X_AXIS = 2 and Y_AXIS = 1) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 2,2
            if (HCOUNT >= POSX + 20*2 + ANCHO*2 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*2 + ANCHO*2 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 2 and Y_AXIS = 2) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 2,3
            if (HCOUNT >= POSX + 20*2 + ANCHO*2 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*3 + ANCHO*3 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 2 and Y_AXIS = 3) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 2,4
            if (HCOUNT >= POSX + 20*2 + ANCHO*2 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*4 + ANCHO*4 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 2 and Y_AXIS = 4) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 3,1
            if (HCOUNT >= POSX + 20*3 + ANCHO*3 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20 and VCOUNT <= (POSY+ANCHO)) then
                if (X_AXIS = 3 and Y_AXIS = 1) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 3,2
            if (HCOUNT >= POSX + 20*3 + ANCHO*3 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*2 + ANCHO*2 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 3 and Y_AXIS = 2) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 3,3
            if (HCOUNT >= POSX + 20*3 + ANCHO*3 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*3 + ANCHO*3 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 3 and Y_AXIS = 3) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 3,4
            if (HCOUNT >= POSX + 20*3 + ANCHO*3 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*4 + ANCHO*4 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 3 and Y_AXIS = 4) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;
            
            -- CUADRO 4,1
            if (HCOUNT >= POSX + 20*4 + ANCHO*4 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20 and VCOUNT <= (POSY+ANCHO)) then
                if (X_AXIS = 4 and Y_AXIS = 1) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 4,2
            if (HCOUNT >= POSX + 20*4 + ANCHO*4 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*2 + ANCHO*2 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 4 and Y_AXIS = 2) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 4,3
            if (HCOUNT >= POSX + 20*4 + ANCHO*4 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*3 + ANCHO*3 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 4 and Y_AXIS = 3) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;

            -- CUADRO 4,4
            if (HCOUNT >= POSX + 20*4 + ANCHO*4 and HCOUNT <= (POSX+ANCHO+20) and VCOUNT >= POSY + 20*4 + ANCHO*4 and VCOUNT <= (POSY+ANCHO+20)) then
                if (X_AXIS = 4 and Y_AXIS = 4) then
                    PAINT <= '1';
                else
                    PAINT <= '0';
                end if;
            end if;