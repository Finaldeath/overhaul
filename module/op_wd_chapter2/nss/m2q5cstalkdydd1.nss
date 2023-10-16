#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance");
    int iTalk = GetLocalInt(GetPCSpeaker(),"NW_L_TalkToDydd");
    if ((iPlot == 0) && (iTalk == 0))
    {
        return CheckCharismaLow();
    }
    return FALSE;
}
