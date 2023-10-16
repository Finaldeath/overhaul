////Check if PC was one who completed Uthgardt quest

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"Uthgardt_Plot") == GetPCSpeaker();

    return iResult;
}
