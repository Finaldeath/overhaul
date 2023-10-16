#include "hx_inc_appear"
// Check for regular wolf.
int StartingConditional()
{
    if((GetTag(OBJECT_SELF) == "hx_winter_wolf" || GetTag(OBJECT_SELF) == "hx_winter_wolf_s") && GetLocalInt(GetModule(), "HX_WOLF_QUEST") == 3
       && CheckWolfQuest(GetPCSpeaker()) == TRUE)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
