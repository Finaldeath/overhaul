// if the PC has not spoken to the ranger yet
// and the PC is an elf

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    if (nRace == RACIAL_TYPE_ELF)
    {
        object oPC = GetPCSpeaker();
        if (GetLocalInt(oPC, "X1_QFootTalkRanger") != 1)
        {
            SetLocalInt(oPC, "X1_QFootTalkRanger", 1);
            return TRUE;
        }
    }
    return FALSE;
}
