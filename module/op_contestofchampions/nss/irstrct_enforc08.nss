#include "inc_module"

int StartingConditional()
{
    object oPlayer;

    oPlayer = GetPCSpeaker();

    if ( oPlayer == GetBattleMaster() )
    {
        return TRUE;
    }

    return FALSE;
}
