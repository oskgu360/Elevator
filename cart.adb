WITH Text_Io; USE Text_Io;
with Calendar; use Calendar;

PACKAGE BODY Cart IS

      task semaphore is
            entry P;			-- Dijkstra’s terminology
            entry V;			-- from the Dutch	
	end semaphore;
	task body semaphore is
		begin
		loop
			accept P;	-- won’t accept another P until a caller asks for V
			accept V;
		end loop;
	end semaphore;

   
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
      BEGIN
            operationDelay := clock;
            if C.max_level = C.min_level AND C.min_level = C.level.level then
                  put("IDLE ON FLOOR ");put(Integer'Image(C.level.level));new_line;
                  operationDelay := operationDelay + 3.0;
                  delay until operationDelay;
                  return;
            end if;
            

            put("DRIVE: Min floor: ");put(Integer'Image(C.min_level));put(" Max floor: ");put(Integer'Image(C.max_level)); put(" Current floor: ");put(Integer'Image(C.level.level));new_line;
            operationDelay := operationDelay + 1.0;
            delay until operationDelay;
            
            semaphore.P;

            if C.dir = Up AND 
            (isPressed(C.floorList(C.level.level).buttons(Up)) OR                          
            isPressed(C.buttons(C.level.level))) 
            then
                  setFalse(C.floorList(C.level.level).buttons(Up));
                  setFalse(C.buttons(C.level.level));
                  calculateMinMax(C); -- Calculate new min max

                  put("Opening doors at floor "); put(Integer'Image(C.level.level));new_line;
                  operationDelay := operationDelay + 5.0;
                  delay until operationDelay;
                  put("Closing doors at floor "); put(Integer'Image(C.level.level));new_line;

            elsif C.dir = Down AND
            (isPressed(C.floorList(C.level.level).buttons(Down)) OR
            isPressed(C.buttons(C.level.level))) 
            then
                  setFalse(C.floorList(C.level.level).buttons(Down));
                  setFalse(C.buttons(C.level.level));
                  calculateMinMax(C); -- Calculate new min max

                  put("Opening doors at floor "); put(Integer'Image(C.level.level));new_line;
                  operationDelay := operationDelay + 5.0;
                  delay until operationDelay;
                  put("Closing doors at floor "); put(Integer'Image(C.level.level));new_line;
            end if;
            
            if C.level.level < C.max_level AND C.dir = Up then
                  C.level.level := C.level.level + 1;
            elsif C.level.level > C.min_level AND C.dir = Down then
                  C.level.level := C.level.level - 1;
            elsif (C.level.level = C.min_level OR C.level.level < C.min_level)  AND C.dir = Down then
                  C.dir := Up;
                  put("Changing direction to up at floor "); put(Integer'Image(C.level.level));new_line;
            elsif (C.level.level = C.max_level OR C.level.level > C.max_level)  AND C.dir = Up then
                  C.dir := Down;      
                  put("Changing direction to down at floor "); put(Integer'Image(C.level.level));new_line;
            end if;
            semaphore.V;
      END;
      

      procedure pressCartButton(C : IN OUT cart; L : IN integer) IS
      BEGIN
            
            semaphore.P;

            press(C.buttons(L));
            calculateMinMax(C);
            -- put(" Min floor: ");put(Integer'Image(C.min_level));put(" Max floor: ");put(Integer'Image(C.max_level)); put(" Current floor: ");put(Integer'Image(C.level.level));new_line;
            semaphore.V;
         
      END;

      procedure pressFloorButton(C : IN OUT cart; L : IN integer; D : IN direction) IS 
      BEGIN 
            semaphore.P;
            press(C.floorList(L).buttons(D));
            calculateMinMax(C);
            --put(" Min floor: ");put(Integer'Image(C.min_level));put(" Max floor: ");put(Integer'Image(C.max_level)); put(" Current floor: ");put(Integer'Image(C.level.level));new_line;    
            semaphore.V;
        
      END;

      procedure calculateMinMax(C : IN OUT cart) IS 
      -- Calculate new min and max after change in button presses --
      BEGIN
            C.min_level := 8;
            C.max_level := -1;
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

            if C.min_level = 8 AND C.max_level = -1 then
                  C.min_level := C.level.level;
                  C.max_level := C.level.level;
            end if;
      END;

      procedure destructCart is 
      BEGIN
            abort semaphore;
      END;
End Cart;