library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PBTON : in  STD_LOGIC;
           HS : out  STD_LOGIC;
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0));
			  
	-- Las siguientes declaraciones realizan la asignacion de pines 
	attribute loc: string;
	attribute loc of CLK : signal is "E3"; -- Pin de reloj
	attribute loc of RST : signal is "U9"; -- Pulsador BTN0
	attribute loc of PBTON : signal is "U8"; -- Pulsador BTN1
	attribute loc of HS : signal is "B11"; -- Driver VGA
	attribute loc of VS	: signal is "B12"; -- Driver VGA
	attribute loc of RGB: signal is "A3,B4,C5,A4,C6,A5,B6,A6,B7,C7,D7,D8"; -- Driver VGA
	
	attribute IOSTANDARD : string;
	attribute IOSTANDARD of CLK: signal is "LVCMOS33";
	attribute IOSTANDARD of RST: signal is "LVCMOS33";
	attribute IOSTANDARD of PBTON: signal is "LVCMOS33";
	attribute IOSTANDARD of HS: signal is "LVCMOS33";
	attribute IOSTANDARD of VS: signal is "LVCMOS33";
	attribute IOSTANDARD of RGB: signal is "LVCMOS33";
	
	--attribute PULLDOWN: string;
   --attribute PULLDOWN of RST: signal is "TRUE";
   --attribute PULLDOWN of PBTON: signal is "TRUE";
end VGACounter;

architecture Behavioral of VGACounter is
	-- Declaramos componentes

	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;

    component square is
        Generic (   POSX: INTEGER:= 100;
                    POSY: INTEGER:= 50;
                    ANCHO: INTEGER:= 20;
                    X_AXIS_SET: INTEGER:=1;
                    Y_AXIS_SET: INTEGER:=1); 
    
       Port (  HCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
               VCOUNT:  in  STD_LOGIC_VECTOR (10 downto 0);
               X_AXIS:  in integer range 1 to 4;
               Y_AXIS:  in integer range 1 to 4;
               VALUE:   in  STD_LOGIC_VECTOR (3 downto 0);
               PAINT:   out  STD_LOGIC);
    end component;

	
	-- Declaramos seales
	signal hcount : STD_LOGIC_VECTOR (10 downto 0);
	signal vcount : STD_LOGIC_VECTOR (10 downto 0);
    signal paint2, paint4 : STD_LOGIC;
    signal paint1 : STD_LOGIC;
    signal paint0 : STD_LOGIC;
	signal rgb_aux1 : STD_LOGIC_VECTOR (2 downto 0);
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);
	signal conteo : std_logic_vector(9 downto 0);
	signal ascii : STD_LOGIC_VECTOR (6 downto 0);
	signal unidades : std_logic_vector(3 downto 0);
	signal decenas : std_logic_vector(3 downto 0);
	signal centenas : std_logic_vector(3 downto 0);
	signal CLK_1Hz : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;

    begin

	CLK_DIV: process(CLK)
	begin
		if(CLK'event and CLK='1') then
			if (count_clk = 50000000) then
				count_clk <= 0;
				CLK_1Hz <= not CLK_1Hz;
			else
				count_clk <= count_clk +1;
			end if;
		end if;
	end process;
	
	cuadro1: square 
    component square is
        Generic (POSX => 100,POSY => 50,ANCHO => 20,X_AXIS_SET=>1,Y_AXIS_SET => 1); 
       Port map (  HCOUNT => hcount,VCOUNT => vcount,PAINT => paint);
  

	Display1: Display  
	GENERIC MAP (
		LW => 5,
		DW => 25,
		DL => 40,
		POSX => 17,
		POSY => 10)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => decenas,
		PAINT => paint1
	);
	
	Display4: Display  
	GENERIC MAP (
		LW => 5,
		DW => 25,
		DL => 40,
		POSX => 77,
		POSY => 10)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => "1001",
		PAINT => paint4
	);
	
	Display0: Display 
	GENERIC MAP (
		LW => 20,
		DW => 100,
		DL => 160,
		POSX => 440,
		POSY => 240)
	PORT MAP(
		HCOUNT => hcount,
		VCOUNT => vcount,
		VALUE => unidades,
		PAINT => paint0
	);

	rgb_aux1 <= "110" when paint2='1' else
	           "001" when paint1='1' else
				  "100" when paint0='1' else
				  "111" when paint4='1' else
				  "001" when (hcount = 60)  else
				  "001" when (vcount = 60) and (hcount < 480)else
				  "001" when (hcount = 120) else
				  "000";

	rgb_aux3 <= rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(2)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(1)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0)&rgb_aux1(0);

	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz PORT MAP(
		rst => RST,
		clk => CLK,
		rgb_in => rgb_aux3,
		HS => HS,
		VS => VS,
		hcount => hcount,
		vcount => vcount,
		rgb_out => rgb_aux2,
		blank => open
	);
	
	
	RGB <= rgb_aux2;
end Behavioral;

