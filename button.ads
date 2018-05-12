PACKAGE Button IS

type button is new Boolean;

function isPressed(B : button) return Boolean;

procedure press(B : IN OUT button);

procedure setFalse(B : IN OUT button);

function initButton return button; -- Constructor

End Button;
