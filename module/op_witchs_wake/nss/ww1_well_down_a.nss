//::///////////////////////////////////////////////
//:: Witchwork 1: Old Man's Well, Climb Down Action
//:: WW1_Well_Down_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Send the player and all associates to the
     Brogan's Tears.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oRope = GetObjectByTag("WP_Rope");

    DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oRope)));
}

