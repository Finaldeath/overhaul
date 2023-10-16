//::///////////////////////////////////////////////
//:: Iridor Main Plot Check 1
//:: iridor_main_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player has not yet received the quest
    from Lord Iridor, this check returns true.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}
