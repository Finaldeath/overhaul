//::///////////////////////////////////////////////
//:: Name q4a_fairy_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks to see if the PC is poly-
    morphed into a pixie.  If so, give them the
    option to fly through the hole.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    if(GetAppearanceType(GetPCSpeaker()) != APPEARANCE_TYPE_FAIRY)
       return TRUE;
    else
       return FALSE;

}
