void main()
{
  object oClicker = GetLastUsedBy();
  if(GetLocalInt(oClicker,"NW_L_M1S3Tests") == 20)
  {
    object oTarget = GetObjectByTag("WP_M1S3BLanding");
    location lLoc = GetLocation(oTarget);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    if(GetIsObjectValid(GetLocalObject(GetArea(oTarget),"NW_G_M1S3BTestee")))
    {
        SpeakOneLinerConversation();
    }
    else
    {
        AssignCommand(oClicker,JumpToLocation(lLoc));
    }
  }
  else
  {
     SpeakOneLinerConversation();
  }
}
