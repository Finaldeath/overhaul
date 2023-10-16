//Check if a PC is getting wine for Torias.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q5a_Torias_Wine")==2)
        return TRUE;
    return FALSE;
}
