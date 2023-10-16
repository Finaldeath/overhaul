int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"os_jointemple_pc")<10;
    return iResult;
}
