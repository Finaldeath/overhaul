// if Aribeth has been given two pieces of information
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Journals_Given") == 1;
    return iResult;
}
