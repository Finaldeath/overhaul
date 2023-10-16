//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if PC has magic antlers.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 6, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC,"q1foot_horns");
    if (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalObject(OBJECT_SELF, "oHornsToDestroy", oItem);
        return TRUE;
    }
    return FALSE;
}
