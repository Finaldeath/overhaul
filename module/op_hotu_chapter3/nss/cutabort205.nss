//::///////////////////////////////////////////////
//:: Name cutabort205
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     First crystal cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:Sept 25, 2003
//:://////////////////////////////////////////////

// Clear effects.
void ClearAllEffects();
// Clear all the player's associates.
void ClearParty(object oObject);

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oCrystal = GetObjectByTag("hx_crystal_1");

    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, ActionJumpToObject(oCrystal));
}

// Clear all the player's associates.
void ClearParty(object oObject)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllEffects());
       // DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
    }
}

void ClearAllEffects()
{
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }
}
