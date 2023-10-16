// check if the slaves hate the PC for turning them down earlier

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q3_Slave_Hate") == 1;
    return iResult;
}
