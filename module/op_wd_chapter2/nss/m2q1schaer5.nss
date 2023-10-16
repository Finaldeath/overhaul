#include "nw_i0_plot"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceNormal() &&
               (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISTIRGEEAR")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IZOREAR")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q02IWYVERNEAR")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IDELILAHEAR")));
    return l_iResult;
}
