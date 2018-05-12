with Text_Io; use Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Calendar; use Ada.Calendar;
with cart; use cart;
with floors; use floors;


procedure elevator is


    cart_one : cart.cart := initCart;


    --- TASK BUTTONS ----
    task button_signals is 
        entry cart_press (F : in integer);
        entry floor_press (D : in floors.direction; L : in integer);
    end button_signals;
    task body button_signals is
    begin
        select
            accept cart_press(F : in integer) do
                pressCartButton(cart_one, F); 
            end cart_press;
        or  
            accept floor_press(D : in direction; L : in integer) do
                pressFloorButton(cart_one, L, D);
            end floor_press;
        end select;
    end button_signals; 

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
        Put (Integer'Image (level));
        Put (", that's an integer!");
        New_Line;
    end inside_elevator;
    
    procedure Get_Input is
        Level: String (1..80);
        direction: String (1..80);
        Length : Integer;
        LengthDir : Integer;
        LevelInt : Integer;
    begin    
        Put ("What floor are you on?> ");
        Get_Line (level, Length);
        New_Line;  
        LevelInt := Integer'Value (Level (1..Length));
        Put (Integer'Image (levelInt));
        Put (", that's an integer!");
        New_Line;
        
        Put_line ("Do you want to go up or down?");
        Get_Line (direction, LengthDir);
        New_Line;
        IF Direction (1..LengthDir) = "up" THEN
            Put_line ("Going up up up up uh up");
        ELSIF Direction (1..LengthDir) = "down" THEN
            Put_line ("Shit is going down!");
        end if;
    end Get_Input;
    --- MAIN ---
begin  
    button_signals.cart_press(8);
    button_signals.floor_press(Up, -1);
    Get_Input;
    Inside_Elevator;  
    new_line; put("splat");new_line;
    abort button_signals;
end elevator;