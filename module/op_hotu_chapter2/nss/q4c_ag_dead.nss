//Checks if ferron has been told aghaaz is dead

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Aghaaz_Dead")==1;
    return iResult;
}
