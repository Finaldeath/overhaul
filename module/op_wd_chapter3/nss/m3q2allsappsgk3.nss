#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q2PLOTULTARGSEEDSPLANTED") ==0 &&
            HasUtargSeedsOrNotebook(GetPCSpeaker());
    //////////  AND CHECK IF PC HAS ULTARG SEEDS OR SAPPHIRA'S NOTEBOOK

    return iResult;
}
