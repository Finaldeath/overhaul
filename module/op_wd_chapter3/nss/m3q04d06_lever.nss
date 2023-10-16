// * * This lever will  open the nearest fire giant bridge door

void main()
{
   object oLastUsed = GetLastUsedBy();
   //if (GetAbilityScore(oLastUsed, ABILITY_STRENGTH) >= 31)
   {
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetNearestObjectByTag("M34G06_LeverDoor");
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
   }
//   else
//   {
//    ActionStartConversation(OBJECT_SELF);
//   }
}
