#include "hx_inc_appear"
// Check for regular wolf.
int StartingConditional()
{
    if((GetTag(OBJECT_SELF) == "hx_winter_wolf" || GetTag(OBJECT_SELF) == "hx_winter_wolf_s") && CheckWolfQuest(GetPCSpeaker()) == TRUE && GetLocalInt(GetModule(), "HX_WOLF_QUEST") != 3)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
