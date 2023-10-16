//::///////////////////////////////////////////////
//:: Name con_q2bhench_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the PC has two companions already.
    Return True if PC already has more than 1 companion

    NOTE - July 15 - multiple henchmen not implemented yet
         - testing for 1 henchman
    UPDATE - July 25th - support for multiple henchmen added
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 15/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    //See if the 2nd Henchman slot is already filled
    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);

    if (GetIsObjectValid(oHench) == TRUE)
        return TRUE;

    return FALSE;
}
