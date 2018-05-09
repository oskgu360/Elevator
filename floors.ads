with Button; use Button;
PACKAGE Floors IS

    type dir_buttons is array(1..2) of button.button;
    type floors is tagged 
        record
            level : Integer;
            buttons : dir_buttons;
        end record;
    
    function initFloor(L : Integer) return floors; -- Constructor
    -- function which_level(F : floors) return integer;  FUCK GETTERS

End Floors;
