//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if Deekin is the PC's henchman
     for interjections in dialogue.
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider and Dan Whiteside
//:: Created On: May 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oHench = GetHenchman(GetPCSpeaker());
    if (oHench == (GetObjectByTag("x0_hen_dee")))
        return TRUE;
    return FALSE;
}
