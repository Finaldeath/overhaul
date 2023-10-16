////Star Sapphire Quest done, PC completed it

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"StarSapphire") ==99 &&
              GetLocalObject(OBJECT_SELF,"StarSapphirePC") ==GetPCSpeaker();
    return iResult;
}
