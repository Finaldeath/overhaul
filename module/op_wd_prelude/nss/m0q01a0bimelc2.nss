/////Reset locals to start tutorial over

void main()
{
    SetLocalInt(GetPCSpeaker(),"SkipTutorial",0);
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",0);
      SetLocalInt(OBJECT_SELF,"NW_L_CallingOut",TRUE);
}

