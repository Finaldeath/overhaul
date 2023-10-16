#include "inc_module"

void main()
{
    object oPlayer;
    int nActiveMapIndex;

    oPlayer = GetPCSpeaker();

    nActiveMapIndex = GetActiveBattleMap();

    AssignCommand(oPlayer, ApplyObserverModeEffects(oPlayer) );
    MovePlayerToGameStartLocation(nActiveMapIndex,oPlayer);
}
