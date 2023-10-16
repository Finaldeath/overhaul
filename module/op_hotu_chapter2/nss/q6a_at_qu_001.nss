
void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  // if the ambush count-down is active than stop it and let the drow exit now.
  if(GetLocalInt(GetArea(OBJECT_SELF), "PC_AMBUSH_ACTIVE") == 1)
  {
        SetLocalInt(GetArea(OBJECT_SELF), "PC_AMBUSH_ACTIVE", 0);
        object oTrig = GetObjectByTag("q6d_trig_player_ambsuh");
        SignalEvent(oTrig, EventUserDefined(101));
        return;
  }
  AssignCommand(oClicker,JumpToObject(oTarget));


}
