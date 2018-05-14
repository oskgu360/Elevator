with floors; use floors;
with Calendar; use Calendar;
with button; use button;
PACKAGE Cart IS

      type floor_list is array(0..8) of floors.floors;
      type floor_buttons is array(0..8) of button.button;   

      type cart is tagged
            record
                  level : floors.floors;
                  max_level : integer;
                  min_level : integer;
                  floorList : floor_list;
                  buttons : floor_buttons;
                  dir : floors.direction;
                  operationDelay : time;
            end record;
    
      function initCart return cart; -- Constructor

      procedure driveCart(C : IN OUT cart);

      procedure pressCartButton(C : IN OUT cart; L : IN integer);      

      procedure pressFloorButton(C : IN OUT cart; L : IN integer; D : IN direction);

      procedure calculateMinMax(C : IN OUT cart);

      procedure destructCart;

End Cart;
