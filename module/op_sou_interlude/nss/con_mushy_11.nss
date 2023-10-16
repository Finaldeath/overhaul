//Check if a PC is supposed to get Mushy to share.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q5a_Musharak_Wine")==3)
        return TRUE;
    return FALSE;
}
