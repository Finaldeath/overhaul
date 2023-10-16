int StartingConditional()
{
//    SpeakString("here");
    int iResult = GetLocalInt(OBJECT_SELF, "Generic_Surrender");
    if(iResult == 1 && !GetIsObjectValid(GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}

