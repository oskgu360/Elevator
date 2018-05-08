PACKAGE Button IS

type button is new Boolean;

function isPressed(B : button) return Boolean;

procedure press(B : IN OUT button);

End Button;
