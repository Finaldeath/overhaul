// PC knows that Londa's children are dead

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if ((iPlot == 30) || (HasItem(GetPCSpeaker(),"M2Q4A_Child_Toy")))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
