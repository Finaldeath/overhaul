void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_UsePortal") == 0)
  {
      SetLocalInt(GetArea(OBJECT_SELF),"NW_A_UsePortal",1);
      DelayCommand(3.0,SetLocalInt(GetArea(OBJECT_SELF),"NW_A_UsePortal",0));
      SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

      ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),GetLocation(oClicker));
      ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),lLoc);
      AssignCommand(oClicker,JumpToLocation(lLoc));
      AssignCommand(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oClicker),JumpToLocation(lLoc));
      AssignCommand(GetAssociate(ASSOCIATE_TYPE_DOMINATED,oClicker),JumpToLocation(lLoc));
      AssignCommand(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oClicker),JumpToLocation(lLoc));
      AssignCommand(GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oClicker),JumpToLocation(lLoc));
      AssignCommand(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oClicker),JumpToLocation(lLoc));
   }
}
