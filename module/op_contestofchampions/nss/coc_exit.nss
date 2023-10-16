#include "inc_module"

void main()
{
    object oPlayer;
    int nTeam;

    oPlayer = GetExitingObject();
    nTeam = GetPlayerTeam(oPlayer);

    if ( oPlayer == GetBattleMaster() )
    {
        GetNewBattleMaster();
    }

    DecrementNumPlayers();
    CheckPlayerOut(oPlayer);
    RemovePlayerFromTeam(nTeam,oPlayer);
}
