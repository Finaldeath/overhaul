///Checks if PC was evil to character
////character reacts negatively and closes off information

int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"Evil") ==GetPCSpeaker();
    return iResult;
}


