///TalkLevel is 1 or greater:
///Creature has been talked to before

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") >= 1;
    return iResult;
}
