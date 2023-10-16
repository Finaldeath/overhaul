//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has the Mummified Hand
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oHand = GetItemPossessedBy(oPC,"mummifiedhand");
    if (GetIsObjectValid(oHand)== TRUE)
    {
        SetLocalObject(OBJECT_SELF,"MUMMIFIEDHAND",oHand);
        return TRUE;
    }
    return FALSE;
}
