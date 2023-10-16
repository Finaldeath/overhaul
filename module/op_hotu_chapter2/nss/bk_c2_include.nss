//::///////////////////////////////////////////////
//:: bk_c2_include
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include file for some of Brent's additions
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////

// * if bKnockdown = TRUe they are knocked down, so they have to get up
// * at the opposite it
void JumpAssociates(object oPC, location lLoc, int bKnockdown = FALSE, int bJumpDown = FALSE)
{
        object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
        object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
        if(oAnimal != OBJECT_INVALID)
            AssignCommand(oAnimal, ActionJumpToLocation(lLoc));
        if(oDominated != OBJECT_INVALID)
            AssignCommand(oDominated, ActionJumpToLocation(lLoc));
        if(oFamiliar != OBJECT_INVALID)
            AssignCommand(oFamiliar, ActionJumpToLocation(lLoc));
        if(oSummoned != OBJECT_INVALID)
            AssignCommand(oSummoned, ActionJumpToLocation(lLoc));

        effect eKnockdown = EffectKnockdown();

        int i = 1;
        object oHenchman = GetHenchman(oPC, i);
        while(oHenchman != OBJECT_INVALID)
        {
            AssignCommand(oHenchman, ActionJumpToLocation(lLoc));

            if (bKnockdown)
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oHenchman, 3.0);
            if (bJumpDown)
            {
                effect eAppear = EffectAppear(1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eAppear, oHenchman);
             }
            i++;
            oHenchman = GetHenchman(oPC, i);

        }
}
