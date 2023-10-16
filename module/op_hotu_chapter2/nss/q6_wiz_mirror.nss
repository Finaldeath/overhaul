//Checks if wizard has been told apprentice gave up his shard

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Mirror")==1;
    return iResult;
}
