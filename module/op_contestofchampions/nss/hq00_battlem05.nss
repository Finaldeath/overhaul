#include "inc_module"

int StartingConditional()
{
    object oPlayer;

    // Observer mode disabled temporarily.
    return FALSE;

    oPlayer = GetPCSpeaker();
    if ( GetGameStarted() == TRUE &&
         GetPlayerCheckedIn(oPlayer) == FALSE )
    {
        return TRUE;
    }

    return FALSE;
}
