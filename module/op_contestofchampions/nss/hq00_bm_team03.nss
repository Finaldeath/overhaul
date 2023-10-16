#include "inc_module"

int StartingConditional()
{
    int nTeam;
    object oPlayer;

    if ( GetNumTeams() > 3 )
    {
        oPlayer = GetPCSpeaker();
        nTeam = GetPlayerTeam(oPlayer);

        if ( nTeam != TEAM_PURPLE )
        {
            return TRUE;
        }
    }

    return FALSE;
}
