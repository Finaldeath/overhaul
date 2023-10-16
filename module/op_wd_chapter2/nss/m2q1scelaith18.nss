#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF,"Num_Gems_Returned");
    if ((iPlot < 2) && ((HasItem(GetPCSpeaker(),"M2Q1ITGEMSETARA")) || (HasItem(GetPCSpeaker(),"M2Q1ITGEMSHART")) || (HasItem(GetPCSpeaker(),"M2Q1ITGEMWANEV"))))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
