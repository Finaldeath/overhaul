#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;
    object oSpeaker = GetLastSpeaker();

    l_iResult = CheckIntelligenceNormal() &&
                !GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL01")) &&
                !GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL02")) &&
                !GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL03")) &&
                !GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL04")) &&
                GetLocalInt(GetPCSpeaker(),"NW_L_M1S4Rules");
    return l_iResult;
}
