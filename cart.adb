WITH Text_Io; USE Text_Io;

PACKAGE BODY Cart IS

      function initCart return cart IS
            C : cart;
      BEGIN
            for I in -1..8 loop
                  C.floorList(I) := initFloor(I);
                  C.buttons(I) := initButton;
            end loop;

            C.level := C.floorList(0);          
            C.dir := Up;
            C.idle := true;
            RETURN C;
      END;

      procedure driveCart(C : cart) IS
      BEGIN
            IF C.idle THEN
                  put("Success");
            END IF;
      END;
End Cart;