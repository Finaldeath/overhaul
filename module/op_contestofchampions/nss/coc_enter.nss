#include "inc_module"

void main()
{
    int nNumPlayers;
    object oPlayer;

    oPlayer = GetEnteringObject();
    nNumPlayers = IncrementNumPlayers();

    // If this is the first creature to join the
    // module... set them up as the Battle Master
    if ( nNumPlayers == 1 )
    {
        //SetBattleMaster(oPlayer);
        InitializeModule();
    }

    // Initialize the team variable on the player
    // to be -1.
    SetLocalInt(oPlayer,"m_nTeam",-1);

    // If the player isn't spawning into the start
    // area, then we have to move them there.
    RemoveAllEffects(oPlayer);
    RemoveAllPlotItems(oPlayer);

    if ( GetLocalInt(oPlayer,"m_bDisconnectedMidGame") == TRUE )
    {
        object oStartWaypoint = GetObjectByTag("irestrict_start");
        object oStartArea = GetArea(oStartWaypoint);
        if ( GetArea(oPlayer) != oStartArea )
        {
            AssignCommand(oPlayer,JumpToLocation(GetLocation(oStartWaypoint)));
        }

        DeleteLocalInt(oPlayer,"m_bDisconnectedMidGame");
    }
    else
    {
        SetLocalInt(oPlayer,"m_bDisconnectedMidGame",TRUE);
    }
}
