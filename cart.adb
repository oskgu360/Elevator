WITH Text_Io; USE Text_Io;
WITH Ada.Numerics.Discrete_Random;

PACKAGE BODY Cart IS

   PROCEDURE DisplayCart(C : Cart) IS
      R : Rank;
      HT : constant Character := Character'Val(9);
   BEGIN
      R := C.M_Rank;
      IF R = v10 THEN Put("10");
      -- display second character of enumeration type
      ELSE Put(Rank'Image(R)(2));
      end if;
      text_IO.Put(suit'image(C.M_Suit) & HT);
   END;

   PROCEDURE Flip(C : IN OUT Cart) is
   BEGIN
      C.M_IsFaceUp := NOT C.M_IsFaceUp;
   end;

   FUNCTION GetValue(C : Cart) RETURN Natural IS
      value : Natural := 0;
   BEGIN
      -- if a Carts is face down, its value is 0
      IF C.M_IsFaceUp THEN
         -- value is number showing on Cart, 1 for Ace
         -- but enumeration type starts from 0, so add 1
         Value := Rank'Pos(C.M_Rank) + 1;
         -- value is 10 for all face Carts
         IF (Value > 10) THEN
            Value := 10;
         END IF;
      END IF;
      RETURN Value;
   END;

------ functions for hands

   FUNCTION GetTotal(H : Vector) RETURN Natural IS
      Total : Natural := 0;
      ContainsAce : Boolean := False;
   BEGIN
      -- if hand is empty, return 0
      IF Is_Empty(H) THEN RETURN 0;
      END IF;
      -- if first Cart is face down, getValue returns 0
      -- add up Cart values, treating each ace as 1
      -- but record if the hand contains an ace
      FOR EachCart OF H LOOP
         Total := Total + Carts.GetValue(EachCart);
         IF EachCart.m_Rank = vA THEN  -- if it's an ace
            ContainsAce := True;  -- note the hand contains it
         END IF;
      END LOOP;
      -- if hand contains ace and total is low enough, treat ace as 11
      IF (ContainsAce AND Total <= 11) THEN
      -- add only 10 since we�ve already added 1 for the ace
         Total := Total + 10;
      END IF;
      return total;
   END;

   ------ Subprograms for Deck

   --create a standard deck of 52 Carts
   PROCEDURE Populate ( D : IN OUT Vector) IS
      C : Carts.Cart;
   BEGIN
      Clear(D);
      FOR S IN Carts.Suit LOOP
         FOR R IN Carts.Rank LOOP
            C.M_Rank := R;
            C.M_Suit := S;
            C.M_IsFaceUp := True;
            Append(D, C);
         END LOOP;
      END LOOP;
   END;

   -- shuffle Carts
   PROCEDURE Shuffle ( D : IN OUT Vector) IS
      SUBTYPE Deck_Size IS Integer RANGE 0..51;
      PACKAGE RandomCart IS NEW
         Ada.Numerics.Discrete_Random(Deck_Size);
      USE RandomCart;
      G     : Generator;
      Other : Integer;
   BEGIN
      Reset(G);
      FOR E IN First_Index(D)..Last_Index(D) LOOP
         Other := Random(G);
         Swap(D, E, Other);
      END LOOP;
   END;


   -- deal one Cart to a hand
   PROCEDURE Deal (
         D : IN OUT Vector;
         H : IN OUT Vector) IS
      C : Carts.Cart;
   BEGIN
      IF Is_Empty(D) THEN
         Put_Line("Out of Carts, take a new pack.");
         Populate(D);
         Shuffle(D);
      END IF;
      -- Deal a Cart from the deck to the hand
      C := First_Element(D);
      Delete_First(D);
      Append(H, C);
   END;

End Cart;