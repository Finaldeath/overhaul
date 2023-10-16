//////Check if PC has refused to tell Rolkid their name

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"RolkidName") ==1;
    return iResult;
}

