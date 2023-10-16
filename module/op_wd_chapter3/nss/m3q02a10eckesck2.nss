int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF," NW_L_M3Q02PLOTNOTETAKER") == GetPCSpeaker();
    return iResult;
}
