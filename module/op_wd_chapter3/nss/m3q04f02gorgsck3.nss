    //////////iResult = Player has Klauth's head (MPlAeKlauth's3Q4)
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult = GetLocalInt(OBJECT_SELF,"NW_G_M3Q4F_KLAUTHHEADGIVEN")==0
        && PlayerHasKlauthsHead(GetPCSpeaker());

    return iResult;
}
