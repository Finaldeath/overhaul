//::///////////////////////////////////////////////
//:: Name  x1_50gold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has 50 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 31, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>49)
        return TRUE;
    return FALSE;
}
