// check to see if the PC has mentioned killing Jnah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Intend_To_Kill_Jnah") == 0;
    return iResult;
}
