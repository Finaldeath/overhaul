#include "inc_module"

int StartingConditional()
{
    int nTeam;
    object oPlayer;

    oPlayer = GetPCSpeaker();
    nTeam = GetPlayerTeam(oPlayer);

    if ( nTeam != TEAM_RED )
    {
        return TRUE;
    }

    return FALSE;
}
