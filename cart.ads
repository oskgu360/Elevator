WITH Ada.Containers.Indefinite_Vectors; USE Ada.Containers;

PACKAGE Cart IS

-- Can't make this (A, 2 .. etc as components of an enumeration type
-- must all be literals, so add the v as a prefix
type Rank is (vA, v2, v3, v4, v5, v6, v7, v8, v9, v10, vJ, vQ, vK);

TYPE Suit IS (C, D, H, S);

TYPE Card IS record
      m_Rank : Rank;
      m_Suit : suit;
      m_IsFaceUp : Boolean;
   END RECORD;

PACKAGE CardVectors IS NEW Indefinite_Vectors (Natural, Card);
use CardVectors;

-------- functions for Cart

-- Display one Card eg AS for Ace of Spades
Procedure DisplayCard(C : Card);

-- Flip card, face up to face down or vice versa
Procedure Flip(C : in out Card);

-- Calculate the value of a card, A = 1, Face Cart = 10
FUNCTION GetValue(C : Card) RETURN Natural;

-------- functions for hands

-- Total vaue for a Hand (Player or House)
   FUNCTION GetTotal(H : Vector) RETURN Natural;

------ Functions for Deck (uses same vector container as Hands)

--create a standard deck of 52 Cart
   PROCEDURE Populate(D : IN OUT Vector);

-- shuffle deck of Cart
   procedure Shuffle(D : in out Vector);

-- deal one card to a hand
   procedure Deal(D : in out vector;  H : in out vector);

End Cart;
