with Text_Io; use Text_Io;
with Button; use Button;

PACKAGE BODY Floors IS
    
    function initFloor(L : Integer) return floors is
    F : floors;
    BEGIN 
        F.level := L;
        F.buttons(1) := False;
        F.buttons(2) := False;
        return F;
    END; 

End Floors;