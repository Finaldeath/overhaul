//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     check if PC found rat in the cage.
     or PC has key to the cage...
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 5, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(OBJECT_SELF,"X1_BECKACAGE")==20 || GetIsObjectValid(GetItemPossessedBy(oPC, "q1rumgutkey")))
        return TRUE;
    return FALSE;
}
