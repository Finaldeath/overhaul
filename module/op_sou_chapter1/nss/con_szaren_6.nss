//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has the Mask
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oMask = GetItemPossessedBy(oPC,"x1mask");
    if (GetIsObjectValid(oMask) == TRUE)
    {
        SetLocalObject(OBJECT_SELF,"THEMASK",oMask);
        return TRUE;
    }
    return FALSE;
}
