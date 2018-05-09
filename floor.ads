with Button; use Button;
PACKAGE Floor IS

type floor is new integer;
type Dir_Buttons is array(1..2) of button.button;

-- is record
--         level : integer;
--         buttons : Dir_Buttons;
-- END RECORD;

-- function isPressed(F : Floor) return Boolean;

procedure initFloor(F : IN OUT Floor; L : integer);

End Floor;
