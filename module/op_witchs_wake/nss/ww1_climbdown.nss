//::///////////////////////////////////////////////
//:: Witchwork 1: Rock Climb Down
//:: WW1_ClimbDown.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jumps the player to the bottom of the
     promontory in the Night Hag's Cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oTarget = GetNearestObjectByTag("ClimbBottom");

    AssignCommand(oPC, JumpToObject(oTarget));
    AssignCommand(oHenchman, JumpToObject(oTarget));
    AssignCommand(oFamiliar, JumpToObject(oTarget));
    AssignCommand(oAnimalCompanion, JumpToObject(oTarget));
    AssignCommand(oSummoned, JumpToObject(oTarget));

    SetLocalInt(oPC, "CemeteryClimb", FALSE);
}
