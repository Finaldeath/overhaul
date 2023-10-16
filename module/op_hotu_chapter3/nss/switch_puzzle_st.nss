//////////////////////////////////////////////////////////////////////////////////
// This is for the starting switch. We don't want a spinning arrow here, so it will
// always jump the PC to the same spot.
//
// Created by: Brad Prince
// 9-13-02
//
//////////////////////////////////////////////////////////////////////////////////
// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    AssignCommand(oObject, ClearAllActions());
    AssignCommand(oObject, ActionJumpToLocation(lLoc));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions());
        AssignCommand(oHench1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions());
        AssignCommand(oHench2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions());
        AssignCommand(oHench3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions());
        AssignCommand(oAssoc1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions());
        AssignCommand(oAssoc2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions());
        AssignCommand(oAssoc3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions());
        AssignCommand(oAssoc4, ActionJumpToLocation(lLoc));
    }
}
void main()
{
   object oPC = GetLastUsedBy();
   location lDest = GetLocation(GetWaypointByTag("start_destination"));
   int iPulled = GetLocalInt(OBJECT_SELF, "pulled");

   if(iPulled == 0) {
      SetLocalInt(OBJECT_SELF, "pulled", 1);
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                   EffectVisualEffect(VFX_IMP_HARM), oPC));
      DelayCommand(2.5, AllJumpToLocation(oPC, lDest));
   }
   else {
      SetLocalInt(OBJECT_SELF, "pulled", 0);
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                   EffectVisualEffect(VFX_IMP_HARM), oPC));
      DelayCommand(2.5, AllJumpToLocation(oPC, lDest));
   }
}
