// * * This lever will  open the nearest fire giant bridge door

void main()
{
   object oLastUsed = GetLastUsedBy();
   //if (GetAbilityScore(oLastUsed, ABILITY_STRENGTH) >= 31)
   {
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetNearestObjectByTag("M34G06_LeverDoor");

    // * June 2002: Unlock the door so henchmen don't get confused
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
   }
//   else
//   {
//    ActionStartConversation(OBJECT_SELF);
//   }

    SetLocalInt(GetModule(),"NW_G_M3Q04TALKWOGAR",1);
}
