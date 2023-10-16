#include "inc_module"

int StartingConditional()
{
    object oPlayer;

    oPlayer = GetPCSpeaker();

    if ( GetPlayerCheckedIn(oPlayer) == TRUE )
    {
        return FALSE;
    }

    return TRUE;
}
