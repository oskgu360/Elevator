PACKAGE BODY Button IS
    
    PROCEDURE press(B : IN OUT button) IS
    BEGIN
        B := not B;
    END;

    function isPressed(B : button) RETURN Boolean is
    BEGIN
        return Boolean(B);
    end;

    procedure setFalse(B : IN OUT button) IS
    BEGIN
        B := False;
    END;

    function initButton return button is
    B : button;
    BEGIN 
        B := False;
        return B;
    END; 
End Button;