// * only talk  when player tries to open door of it at specific plot point
int StartingConditional()
{
    int iResult;
  //  SpeakString("here");
    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_TALKPAST") ==2 || GetLocalInt(GetPCSpeaker(),"NW_L_TRIEDTO_OPENDOOR") ==10;
    return iResult;
}


