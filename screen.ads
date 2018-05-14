--::::::::::
--screen.ads
--::::::::::
package Screen is

  -- simple ANSI terminal emulator
  -- Michael Feldman, The George Washington University
  -- July, 1995
  -- ClearScreen function added by D Levy, April 1998

  ScreenHeight : constant Integer := 24;
  ScreenWidth : constant Integer := 80;

  subtype Height is Integer range 1..ScreenHeight;
  subtype Width  is Integer range 1..ScreenWidth;

  type Position is record
    Row   : Height := 1;
    Column: Width := 1;
  end record;

  procedure Beep;
  -- Pre:  none
  -- Post: the terminal beeps once

  procedure ClearScreen;
  -- Pre:  none
  -- Post: the terminal screen is cleared

  procedure MoveCursor (To: in Position);
  -- Pre:  To is defined
  -- Post: the terminal cursor is moved to the given position

  procedure ClearLine;
  -- Pre:  To is defined
  -- Post: the terminal current line is cleared to the end of the line

end Screen;