//::///////////////////////////////////////////////
//:: PC must leave
//:: act_sni_wait
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC promises to deliver honey to the kobolds
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    //if pc tries to go further into cave, all kobolds go hostile and attack,
    //until honey has been given
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_KOBOLD_HONEY",15);
}
