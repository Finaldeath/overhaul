//::///////////////////////////////////////////////
//:: Name q2a_use_tunnelr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Use the Right tunnel to get inside the compound
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 9/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oJumpTo = GetWaypointByTag("wp_q2a_lotower_ladder");

    //Jump the PCs companions.
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

    AssignCommand(oPC, JumpToObject(oJumpTo));
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        DelayCommand(0.5, AssignCommand(oHench, JumpToObject(oJumpTo)));
        i++;
        oHench = GetHenchman(oPC, i);
    }

    if (GetIsObjectValid(oFamiliar) == TRUE)
        DelayCommand(0.5, AssignCommand(oFamiliar, JumpToObject(oJumpTo)));
    if (GetIsObjectValid(oDominated) == TRUE)
        DelayCommand(0.5, AssignCommand(oDominated, JumpToObject(oJumpTo)));
    if (GetIsObjectValid(oSummoned) == TRUE)
        DelayCommand(0.5, AssignCommand(oSummoned, JumpToObject(oJumpTo)));
    if (GetIsObjectValid(oAnimal) == TRUE)
        DelayCommand(0.5, AssignCommand(oAnimal, JumpToObject(oJumpTo)));
}
