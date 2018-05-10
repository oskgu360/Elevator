with Text_Io; use Text_Io;
with Button; use Button;

PACKAGE BODY Floors IS
    
    function initFloor(L : Integer) return floors is
    F : floors;
    BEGIN 
        F.level := L;
        F.buttons(Up) := initButton;
        F.buttons(Down) := initButton;
        return F;
    END; 

End Floors;