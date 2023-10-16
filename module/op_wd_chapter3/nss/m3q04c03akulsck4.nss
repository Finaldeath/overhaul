 ////////////// iResult = Player has Hill Giant Chief's head (MPlUsHillGian3Q4);
#include "m3plotinclude"
int StartingConditional()
{

    int iResult = PlayerHasHillGiantChiefHead(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q4EA_HILLGIANTHEAD")==0;

    return iResult;
}
