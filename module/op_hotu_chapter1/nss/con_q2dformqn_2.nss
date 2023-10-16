//Return True if the Formian Queen has decided to help the PCs vs the Drow
//This only returns true after the final drow battle..
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DFormiansHelp") == 2)
        return TRUE;
    return FALSE;
}
