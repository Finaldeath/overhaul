////////Final battle over, Pavel already initiated dialog
/////// dialog broken out of before final line spoken

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"PavelLeave") ==99;
    return iResult;
}
