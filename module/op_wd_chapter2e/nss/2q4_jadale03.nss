// player may finesse Lady Jadale if they have a high Wisdom
// or they have levels in Bard or Rogue

#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;
    int nClass;
    int iPlot = GetLocalInt(GetPCSpeaker(),"Finessed_Jadale");
    nClass = GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());

    l_iResult = (iPlot == 0) && CheckIntelligenceNormal() && (CheckWisdomHigh() || (nClass > 0));
    return l_iResult;
}
