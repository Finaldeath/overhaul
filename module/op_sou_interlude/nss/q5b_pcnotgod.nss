// the PC is not currently a god

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_PCISGOD") != 10;;
    return iResult;
}
