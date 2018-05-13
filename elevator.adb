with Text_Io; use Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Calendar; use Ada.Calendar;
with cart; use cart;
with floors; use floors;
WITH NT_Console; USE NT_Console;

procedure elevator is

    cart_one : cart.cart := initCart;

    task semaphore is
            entry P;			-- Dijkstra’s terminology
            entry V;			-- from the Dutch	
	end semaphore;
	task body semaphore is
		begin
		loop
			accept P;	-- won’t accept another P until a caller asks for V
			accept V;
		end loop;
	end semaphore;

    -- Prints the elevator
    PROCEDURE Print_Elevator(level : Integer) IS
      Min_Level : Integer := 0;
      Top_Level : Integer := 8;
      print_iterator : integer := 0;

   BEGIN
        semaphore.p;
         For I in min_level .. top_level LOOP
            Goto_XY(40,12-print_iterator);
            Put(Integer'Image(i));
            IF I = Level THEN
               Goto_XY(42,12-print_iterator);
               Put("| [] |");
            ELSE
               Goto_XY(42,12-print_iterator);
               Put("|    |");
            END IF;
            print_iterator := print_iterator + 1;
         END LOOP;
        Goto_XY(0,1);
        semaphore.v;
   end;



    --- TASK BUTTONS ----
    task button_signals is 
        entry cart_press (F : in integer);
        entry floor_press (D : in floors.direction; L : in integer);
    end button_signals;
    task body button_signals is
    begin
        loop
            select
                accept cart_press(F : in integer) do
                    pressCartButton(cart_one, F); 
                end cart_press;
            or  
                accept floor_press(D : in direction; L : in integer) do
                    pressFloorButton(cart_one, L, D);
                end floor_press;
            end select;
        end loop;
    end button_signals; 

    -- Gets user input
    task Get_Input;
    task body Get_Input is
        Level: String (1..80);
        direction: String (1..80);
        Length : Integer;
        LengthDir : Integer;
        LevelInt : Integer;
    begin
        loop
        semaphore.p;
        Goto_XY(0,0);
        Put ("What do you want to do? ex. t4(to floor 4), u2(up from floor 2), d1 (down from floor 1)");
        Goto_XY(0,1);
        semaphore.v;
        Get_Line (level, Length);
        New_Line;
        IF level (1..1) = "u" THEN
            -- Put_line ("Going up!");
            LevelInt := Integer'Value (Level (2 .. 2));
            button_signals.floor_press(Up, levelInt);
        ELSIF level (1..1) = "d" THEN
            -- Put_line ("Going down!");
            LevelInt := Integer'Value (Level (2 .. 2));
            button_signals.floor_press(Down, levelInt);
        ELSIF level (1..1) = "t" THEN
            -- Put_line ("Going down!");
            LevelInt := Integer'Value (Level (2 .. 2));
            button_signals.cart_press(levelInt);
        end if;  
        -- LevelInt := Integer'Value (Level (1..Length));
        -- semaphore.p;
        -- Goto_XY(0,3);
        -- Put_line ("Do you want to go up or down?");
        -- semaphore.v;
        -- Get_Line (direction, LengthDir);
        -- New_Line;
        -- IF Direction (1..LengthDir) = "up" THEN
        --     Put_line ("Going up!");
        --     button_signals.floor_press(Up, levelInt);
        -- ELSIF Direction (1..LengthDir) = "down" THEN
        --      Put_line ("Going down!");
        --     button_signals.floor_press(Down, levelInt);
        -- end if;
        semaphore.p;
        Goto_XY(0,0);
        Put("                                   "); new_line;
        Put("                                   ");new_line;
        Put("                                   ");new_line;
        Put("                                   ");new_line;
        semaphore.v;
        end loop;
     
    end Get_Input;


    -- simulation task that accepts input from terminal
    PROCEDURE Inside_Elevator IS
        button : String (1..80);
        Length : Integer;
        level : Integer;
    BEGIN   
        Put ("Press which button?> ");
        Get_Line (button, Length);
        New_Line;
        Level := Integer'Value (button (1..Length));
    end inside_elevator;


    -- -- SIM --
    -- task sim;
    -- task body sim is
    -- begin
    --     button_signals.cart_press(6);
       
    --     button_signals.cart_press(-1);
    
    --     button_signals.floor_press(Up, -1);
    
    --     button_signals.floor_press(Down, 5);
    --     delay 10.0;
    --     button_signals.cart_press(4);
    -- end sim;

    task driveC;
    task body driveC is
    begin
        loop
            driveCart(cart_one);
            Print_Elevator(cart_one.level.level);
        end loop;
    end driveC;
    --- MAIN ---
begin  
    -- button_signals.cart_press(8);
    -- button_signals.cart_press(-1);
    -- button_signals.floor_press(Up, -1);
    -- Get_Input;

    -- Inside_Elel
    loop
        delaY 60.0;
    end loop;
end elevator;