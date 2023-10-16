//::///////////////////////////////////////////////
//:: Name q1foot_at_stream
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the internal (within 1 area)
    area transitions in the foothills.
    It will make sure that all of a PCs associates
    are transported through with him.
    **UPDATE**
    April 5 - Should also work for secret room in Kobold
    Cave and Elven crypt..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{

    object oTarget = GetTransitionTarget(OBJECT_SELF);
    location lLoc = GetLocation(oTarget);

    //Get the PC and any possible associates
    object oPC = GetClickingObject();

    object oHenchman = GetHenchman(oPC);

    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    AssignCommand(oPC,JumpToLocation(lLoc));
    //If there are any valid associates, jump them to the same spot as the PC.
    if (oHenchman != OBJECT_INVALID)
        DelayCommand(1.0, AssignCommand(oHenchman, JumpToLocation(lLoc)));
    if (oFamiliar != OBJECT_INVALID)
        DelayCommand(1.0, AssignCommand(oFamiliar, JumpToLocation(lLoc)));
    if (oSummoned != OBJECT_INVALID)
        DelayCommand(1.0, AssignCommand(oSummoned, JumpToLocation(lLoc)));
    if (oAnimal != OBJECT_INVALID)
        DelayCommand(1.0, AssignCommand(oAnimal, JumpToLocation(lLoc)));
    if (oDominated != OBJECT_INVALID)
        DelayCommand(1.0, AssignCommand(oDominated, JumpToLocation(lLoc)));


}




