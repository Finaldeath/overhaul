//Check if a PC Murdered the Aoists.
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"q5a_Aoists_Murdered")==1)
        return TRUE;
    return FALSE;
}
