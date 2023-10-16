//Return True if the Formian Queen has decided to help the PCs vs the Drow
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DFormiansHelp") == 1)
        return TRUE;
    return FALSE;
}
