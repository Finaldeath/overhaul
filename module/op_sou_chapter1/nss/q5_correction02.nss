// if Tymofarrar has not already corrected the PC on the nature of the attack

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Attack_Correction") == 0;
    return iResult;
}
