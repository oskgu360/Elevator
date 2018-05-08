PACKAGE BODY Button IS
    
    PROCEDURE press(B : IN OUT button) IS
    BEGIN
        B := not B;
    END;

    function isPressed(B : button) RETURN Boolean is
    BEGIN
    return Boolean(B);
    end;
End Button;