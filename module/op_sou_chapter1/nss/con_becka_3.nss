//::///////////////////////////////////////////////
//:: Name con_becka_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     check if PC has choking powder
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 5, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oPowder = GetItemPossessedBy(oPC, "X1_WMGRENADE004");
    if (GetIsObjectValid(oPowder) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "ChokingPowder", oPowder);
        return TRUE;
    }
    return FALSE;
}
