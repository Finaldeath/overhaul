#include "NW_I0_Plot"
int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
    int bCondition =  CheckIntelligenceLow() &&
                      ( (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q2PlotReagent")) &&
                         GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_PRISONDISTRICT") == FALSE) ||
                        (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q3PlotReagent")) &&
                         GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BLACKLAKEDISTRICT") == FALSE) ||
                        (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q4PlotReagent")) &&
                         GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_DOCKSDISTRICT") == FALSE) ||
                        (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1Q5PlotReagent")) &&
                         GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BEGGARSNEST") == FALSE)  ) ;
    return bCondition;
}
