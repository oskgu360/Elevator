with Text_Io; use Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Calendar; use Ada.Calendar;
with button; use button;
with floors; use floors;
with cart; use cart;


procedure elevator is
    type floor_indicator is range -1..8;
    type direction is (Up, Down);
    dir : direction := Down;
    floor : floor_indicator := 8;
    upButton : button.button := initButton;
    f_one : floors.floors := initFloor(-1);
    cart_one : cart.cart := initCart;


    --- TASK BUTTONS ----
    task button_signals is 
        entry cart_press (F : in integer);
        entry floor_press (D : in direction; L : in integer);
    end button_signals;
    task body button_signals is
    begin
        select
            accept cart_press(F : in integer) do
                put(Integer'Image(F));
            end cart_press;
        or  
            accept floor_press(D : in direction; L : in integer) do
                put(Integer'Image(L));
            end floor_press;
        end select;
    end button_signals; 

    --- MAIN ---
begin  
    put(Integer'Image(f_one.level)); new_line;
    put(Boolean'Image(isPressed(f_one.buttons(Up)))); new_line;
    press(f_one.buttons(Up));
    put(Boolean'Image(isPressed(f_one.buttons(Up)))); new_line;
    driveCart(cart_one);
    
    -- loop
    --     put(Boolean'Image(isPressed(upButton))); new_line;
    --     press(upButton);
        
    --     put(Integer'Image(Integer(floor)));put(" aaaaaaaaaaaaaaaaaaah");new_line;
    --     exit when floor = -1;
    --     floor := floor -1;        
    -- end loop;
    put("splat");new_line;
    abort button_signals;
end elevator;