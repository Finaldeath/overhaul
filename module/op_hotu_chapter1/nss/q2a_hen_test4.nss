//Check to see if the PC has a henchman - TRUE if he does
int StartingConditional()
{
    if (GetHenchman(GetPCSpeaker()) == OBJECT_INVALID)
        return FALSE;
    if (GetHenchman(GetPCSpeaker()) == OBJECT_SELF)
        return FALSE;
    return TRUE;
}
