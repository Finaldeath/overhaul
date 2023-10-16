#include "inc_module"

int StartingConditional()
{
    object oPlayer;

    oPlayer = GetPCSpeaker();

    if ( GetPlayerCheckedIn(oPlayer) == FALSE &&
         GetGameStarted() == TRUE )
    {
        return TRUE;
    }

    return FALSE;
}
