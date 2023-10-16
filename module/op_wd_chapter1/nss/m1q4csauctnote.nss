#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q04IAUCTION")) == TRUE ||
                GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M1Q04IAUCTION")) == FALSE;
    return l_iResult;
}
