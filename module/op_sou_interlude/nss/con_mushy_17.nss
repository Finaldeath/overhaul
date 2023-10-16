//Check if a PC has not got wine deal for Mushy already.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q5a_Musharak_Wine")!=8)
        return TRUE;
    return FALSE;
}
