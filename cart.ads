WITH Ada.Containers.Indefinite_Vectors; USE Ada.Containers;
with Floor; use Floor;
PACKAGE Cart IS

-- Can't make this (A, 2 .. etc as components of an enumeration type
-- must all be literals, so add the v as a prefix
type Floors is array(-1..8) of floor.floor;

TYPE Suit IS (C, D, H, S);

TYPE Cart IS record
      m_Rank : Rank;
      m_Suit : suit;
      m_IsFaceUp : Boolean;
   END RECORD;

PACKAGE CartVectors IS NEW Indefinite_Vectors (Natural, Cart);
use CartVectors;

-------- functions for Cart

-- Display one Cart eg AS for Ace of Spades
Procedure DisplayCart(C : Cart);

-- Flip Cart, face up to face down or vice versa
Procedure Flip(C : in out Cart);

-- Calculate the value of a Cart, A = 1, Face Cart = 10
FUNCTION GetValue(C : Cart) RETURN Natural;

-------- functions for hands

-- Total vaue for a Hand (Player or House)
   FUNCTION GetTotal(H : Vector) RETURN Natural;

------ Functions for Deck (uses same vector container as Hands)

--create a standard deck of 52 Cart
   PROCEDURE Populate(D : IN OUT Vector);

-- shuffle deck of Cart
   procedure Shuffle(D : in out Vector);

-- deal one Cart to a hand
   procedure Deal(D : in out vector;  H : in out vector);

End Cart;
