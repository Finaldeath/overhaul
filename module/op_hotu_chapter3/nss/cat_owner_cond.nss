//::///////////////////////////////////////////////
//:: Catapults!: Owner Condition Script
//:: Cat_Owner_Cond.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE only if the speaker is designated
    as the catapult's owner.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 2, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oOwner = GetLocalObject(OBJECT_SELF, "oOwner");

    if (oPC == oOwner)
    {
        //Define the Custom Token for this conversation line.
        int iRange = GetLocalInt(oPC, "iRange");
        if (iRange == 0)
        {
            iRange = 15;
        }
        SetCustomToken(500, IntToString(iRange));

        return TRUE;
    }
    return FALSE;
}
