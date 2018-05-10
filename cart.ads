WITH Ada.Containers.Indefinite_Vectors; USE Ada.Containers;
with floors; use floors;
with button; use button;
PACKAGE Cart IS

      type floor_list is array(-1..8) of floors.floors;
      type direction is (Up, Down);
      type floor_buttons is array(-1..8) of button.button;   

      type cart is tagged 
            record
                  level : floors.floors;
                  max_level : integer;
                  min_level : integer;
                  floorList : floor_list;
                  buttons : floor_buttons;
                  dir : direction;
                  idle : boolean;
            end record;
    
      function initCart return cart; -- Constructor
      -- function which_level(F : floors) return integer;  FUCK GETTERS

      procedure driveCart(C : cart);

      procedure pressCartButton(C : cart; L : integer);

      procedure pressFloorButton(C : cart; L : integer; D : direction);

End Cart;
