// * talking to hill giant
int StartingConditional()
{
    //int iResult;
    if (GetLocalInt(OBJECT_SELF,"M3Q4_L_TALK")==1)
    {
        return TRUE;
    }
//    iResult = GetIsObjectValid(GetPCSpeaker()) == FALSE;
    return FALSE;
}
