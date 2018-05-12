WITH Text_Io; USE Text_Io;
with Calendar; use Calendar;

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
            operationDelay : time;
      -- stopped : boolean := true;
      BEGIN
            IF C.idle THEN
                  C.idle := False;
                  operationDelay := clock;
                  -- TODO: go up and down, add timings (delay until), 
                  -- remove button presses when a floor is visited
                  loop
                        exit when C.min_level = C.max_level and C.max_level = C.level.level;
                        
                        if C.dir = Up AND 
                        (isPressed(C.floorList(C.level.level).buttons(Up)) OR                          
                        isPressed(C.buttons(C.level.level))) 
                        then
                              setFalse(C.floorList(C.level.level).buttons(Up));
                              setFalse(C.buttons(C.level.level));

                              put("Opening doors at floor"); put(Integer'Image(C.level.level));new_line;
                              operationDelay := operationDelay + 5.0;
                              delay until operationDelay;

                        elsif C.dir = Down AND
                        (isPressed(C.floorList(C.level.level).buttons(Down)) OR
                        isPressed(C.buttons(C.level.level))) 
                        then
                              setFalse(C.floorList(C.level.level).buttons(Down));
                              setFalse(C.buttons(C.level.level));

                              put("Opening doors at floor"); put(Integer'Image(C.level.level));new_line;
                              operationDelay := operationDelay + 5.0;
                              delay until operationDelay;
                        end if;

                        operationDelay := operationDelay + 1.0;
                        delay until operationDelay;


                        if C.level.level < C.max_level AND C.dir = Up then
                              C.level.level := C.level.level + 1;
                        elsif C.level.level > C.min_level AND C.dir = Down then
                              C.level.level := C.level.level - 1;
                        elsif C.level.level = C.min_level AND C.dir = Down then
                              C.dir := Up;
                        elsif C.level.level = C.max_level AND C.dir = Up then
                              C.dir := Down;      
                        end if;

                  
                  end loop;
                  C.idle := True;
            END IF;
      END;

      procedure pressCartButton(C : IN OUT cart; L : IN OUT integer) IS
      BEGIN
            press(C.buttons(L));
            calculateMinMax(C);
            driveCart(C);
      END;

      procedure pressFloorButton(C : IN OUT cart; L : IN OUT integer; D : IN OUT direction) IS 
      BEGIN 
            press(C.floorList(L).buttons(D));
            calculateMinMax(C);
            driveCart(C);
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