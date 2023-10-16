#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_ARTI_PLOT_TOLD" + GetTag(OBJECT_SELF));
    int iTalk = GetLocalInt(OBJECT_SELF,"Talked_To_Once");
    if ((iPlot == 0) && (iTalk == 0) && (GetLocalInt(GetModule(),"NW_G_ARTI_PLOT" + GetTag(OBJECT_SELF)) == 0))
    {
        return TRUE;
    }
    return FALSE;
}

