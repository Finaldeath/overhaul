///////////Morag will say this if any of the lizardmen are attacked, or if she finishes her speech

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_M4Q01TALK_PROJECTION") ==1;
    return iResult;
}
