#include "inc_module"

void main()
{
    object oPlayer;
    int nTeam;

    oPlayer = GetPCSpeaker();

    nTeam = GetPlayerTeam(oPlayer);
    CheckPlayerOut(oPlayer);

    RemovePlayerFromTeam(nTeam,oPlayer);
    AddPlayerToTeam(TEAM_BLUE,oPlayer);

    MovePlayerToStartLocation( oPlayer );
    ClearAllActions();
}
