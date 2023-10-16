//Return TRUE before the PC has bought this slave..
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nPCBought") == 0)
        return TRUE;
    return FALSE;
}
