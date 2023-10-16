#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition =  GetLocalInt(GetModule(),"NW_G_M1Q3MeldDead") &&
                      !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00TOOTH")) &&
                      CheckIntelligenceLow();
    return bCondition;
}
