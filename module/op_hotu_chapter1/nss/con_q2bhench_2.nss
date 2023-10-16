//::///////////////////////////////////////////////
//:: Name con_q2bhench_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the PC has two companions already.
    Return True if PC does not have more than 1 companion

    NOTE - July 15 - multiple henchmen not implemented yet
         - testing for 1 henchman
    UPDATE - July 24 - Added multiple henchman check
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 15/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    //See if the 2nd Henchman slot is empty
    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);
    if (GetIsObjectValid(oHench) == FALSE)
        return TRUE;

    return FALSE;
}
