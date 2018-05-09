with Button; use Button;
PACKAGE Floors IS

    type floors is tagged 
        record
            level : Integer;
        end record;
    
    function initFloor(L : Integer) return floors;
    function which_level(F : floors) return integer;   

End Floors;
