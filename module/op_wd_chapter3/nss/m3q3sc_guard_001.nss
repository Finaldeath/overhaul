int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL")==0;
    return iResult;
}
