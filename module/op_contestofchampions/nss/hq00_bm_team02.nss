#include "inc_module"

int StartingConditional()
{
    int nTeam;
    object oPlayer;

    if ( GetNumTeams() > 2 )
    {
        oPlayer = GetPCSpeaker();
        nTeam = GetPlayerTeam(oPlayer);

        if ( nTeam != TEAM_GOLD )
        {
            return TRUE;
        }
    }

    return FALSE;
}
