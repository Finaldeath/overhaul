///////Checks if the speaker has given his gold to a character already


int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(OBJECT_SELF,"Evil") ==1;
    return iResult;
}
