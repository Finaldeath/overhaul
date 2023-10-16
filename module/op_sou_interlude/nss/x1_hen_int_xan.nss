//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Xanos is the PC's henchman
     for interjections in dialogue.
*/
//:://////////////////////////////////////////////
//:: Created By: Dave Gaider and Dan Whiteside
//:: Created On: May 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oHench = GetHenchman(GetPCSpeaker());
    if (oHench == (GetObjectByTag("x0_hen_xan")))
        return TRUE;
    return FALSE;
}
