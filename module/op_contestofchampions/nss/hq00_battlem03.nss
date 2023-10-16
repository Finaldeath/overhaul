#include "inc_module"

int StartingConditional()
{
    object oPlayer;
    int nTeam;

    oPlayer = GetPCSpeaker();
    nTeam = GetPlayerTeam(oPlayer);

    if ( GetPlayerCheckedIn(oPlayer) == FALSE &&
         GetGameStarted() == FALSE &&
         GetTeamLocked(nTeam) == TRUE )
    {
        return TRUE;
    }

    return FALSE;
}
