#include "NW_I0_PLOT"

int StartingConditional()
{
    int iClass = GetLevelByClass(CLASS_TYPE_ROGUE,GetPCSpeaker());
    int iPlot = GetLocalInt(GetPCSpeaker(),"Player_Met_Elaith");
    if ((iPlot < 2) && ((iClass > 0) || (AutoDC(DC_EASY,SKILL_LORE,GetPCSpeaker()))))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
