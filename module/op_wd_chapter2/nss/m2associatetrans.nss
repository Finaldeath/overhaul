void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  AssignCommand(oClicker,JumpToLocation(lLoc));
  AssignCommand(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oClicker),JumpToLocation(lLoc));
  AssignCommand(GetAssociate(ASSOCIATE_TYPE_DOMINATED,oClicker),JumpToLocation(lLoc));
  AssignCommand(GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oClicker),JumpToLocation(lLoc));
  AssignCommand(GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oClicker),JumpToLocation(lLoc));
  AssignCommand(GetAssociate(ASSOCIATE_TYPE_SUMMONED,oClicker),JumpToLocation(lLoc));
}
