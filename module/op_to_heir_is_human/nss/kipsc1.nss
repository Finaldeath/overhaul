int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Kipper_Talk")==0;
    return iResult;
}

