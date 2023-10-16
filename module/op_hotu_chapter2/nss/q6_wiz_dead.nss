//Checks if wizard has been told his apprentice is dead

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Jansil_Dead")==1;
    return iResult;
}
