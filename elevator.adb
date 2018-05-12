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
                put(Integer'Image(F)); -- Tudou: Call pressbutton on cart
            end cart_press;
        or  
            accept floor_press(D : in direction; L : in integer) do
                put(Integer'Image(L)); -- Tudou: Call pressbutton on cart
            end floor_press;
        end select;
    end button_signals; 

    -- Tudou: Create simulation task that accepts input from terminal

    --- MAIN ---
begin  
    -- put(Integer'Image(f_one.level)); new_line;
    -- put(Boolean'Image(isPressed(f_one.buttons(Up)))); new_line;
    -- press(f_one.buttons(Up));
    -- put(Boolean'Image(isPressed(f_one.buttons(Up)))); new_line;
    driveCart(cart_one);
    button_signals.cart_press(1);
    
    -- loop
    --     put(Boolean'Image(isPressed(upButton))); new_line;
    --     press(upButton);
        
    --     put(Integer'Image(Integer(floor)));put(" aaaaaaaaaaaaaaaaaaah");new_line;
    --     exit when floor = -1;
    --     floor := floor -1;        
    -- end loop;
    new_line; put("splat");new_line;
    abort button_signals;
end elevator;