// if Attiz thinks the PC is an emissary to the Hive Mother

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Attiz_Fooled") == 1;
    return iResult;
}
