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
            C.max_level := C.level.level;
            C.min_level := C.level.level;
            C.dir := Up;
            C.idle := true;
            RETURN C;
      END;

      procedure driveCart(C : IN OUT cart) IS
      BEGIN
            IF C.idle THEN
                  C.idle := False;
                  -- TODO: go up and down, add timings (delay until), 
                  -- remove button presses when a floor is visited
                  loop

                  exit when C.min_level = C.max_level and C.max_level = C.level.level;
                  end loop;
                  C.idle := True;
            END IF;
      END;

      procedure pressCartButton(C : IN OUT cart; L : IN OUT integer) IS
      BEGIN
            -- Tudou: Call pressbutton on C.buttons(L)
            press(C.buttons(L));
      END;

      procedure pressFloorButton(C : IN OUT cart; L : IN OUT integer; D : IN OUT direction) IS 
      BEGIN 
            -- Tudou: Call pressbutton on C.floorList(L).buttons(D)
            press(C.floorList(L).buttons(D));
      END;

      procedure calculateMinMax(C : IN OUT cart) IS 
      -- Calculate new min and max after change in button presses --
      BEGIN
            for L in -1..8 loop
                  if L < C.min_level AND 
                        (isPressed(C.floorList(L).buttons(Up)) OR 
                        isPressed(C.floorList(L).buttons(Down)) OR
                        isPressed(C.buttons(L)))
                  then
                        C.min_level := L;
                  end if;
                  if L > C.max_level AND
                        (isPressed(C.floorList(L).buttons(Up)) OR 
                        isPressed(C.floorList(L).buttons(Down)) OR
                        isPressed(C.buttons(L)))
                  then
                        C.max_level := L;
                  end if;
            end loop;
      END;
End Cart;