int StartingConditional()
{
    int iResult = GetLocalInt(OBJECT_SELF, "M3Q3_A2_Surrender");
    if(iResult == 1 && !GetIsObjectValid(GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
