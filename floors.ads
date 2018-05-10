with Button; use Button;
PACKAGE Floors IS

    type direction is (Up, Down);
    type dir_buttons is array(direction) of button.button;   
    type floors is tagged 
        record
            level : Integer;
            buttons : dir_buttons;
        end record;
    
    function initFloor(L : Integer) return floors; -- Constructor
    -- function which_level(F : floors) return integer;  FUCK GETTERS

End Floors;
