// the Host Tower doors are open

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"2Q6_HostTowerDoor") == 1;
    return iResult;
}
