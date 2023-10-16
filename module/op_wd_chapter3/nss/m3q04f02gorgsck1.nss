#include "M3PLOTINCLUDE"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_L_M3Q04PLOTKLAUTHDEAD") ==0
        && !PlayerHasKlauthsHead(GetPCSpeaker())
              && GetLocalInt(GetPCSpeaker(),"Gorgotha_Talk") ==0;
    return iResult;
}
