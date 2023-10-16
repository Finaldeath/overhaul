// the PC has not already shown Daschnaya the crystal

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Daschnaya_See_Crystal") == 0;
    return iResult;
}
