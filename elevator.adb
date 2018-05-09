with Text_Io; use Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Calendar; use Ada.Calendar;
with button; use button;
with floors; use floors;


procedure elevator is
    type floor_indicator is range -1..8;
    type direction_indicator is (Up, Down);


    dir : direction_indicator := Down;
    floor : floor_indicator := 8;
    upButton : button.button := False;
    f_one : floors.floors := initFloor(-1);
    level : integer;
begin  
    level := which_level(f_one);
    put(Integer'Image(level));
    loop
        put(Boolean'Image(isPressed(upButton))); new_line;
        press(upButton);
        
        put(Integer'Image(Integer(floor)));put(" aaaaaaaaaaaaaaaaaaah");new_line;
        exit when floor = -1;
        floor := floor -1;        
    end loop;
    put("splat");new_line;
end elevator;