void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);
  if(GetLocalInt(OBJECT_SELF,"NW_L_Fired") == FALSE &&
     GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100)
  {
    CreateObject(OBJECT_TYPE_CREATURE,"M1Q5H2ZOMBIE",GetLocation(GetWaypointByTag("SP_KRESZOMBIE")));
    SetLocalInt(OBJECT_SELF,"NW_L_Fired",TRUE);
  }
  AssignCommand(oClicker,JumpToLocation(lLoc));
}
