with Text_Io; use Text_Io;

PACKAGE BODY Floors IS
    
    function initFloor(L : Integer) return floors is
    F : floors;
    BEGIN 
        F.level := L;
        return F;
    END; 

    function which_level(F : floors) return integer is
    BEGIN
        return F.level;
    END;

End Floors;