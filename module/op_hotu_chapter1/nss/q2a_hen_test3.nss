//Check to see if the PC already has a henchman.
//Return FALSE if he does
int StartingConditional()
{
    if (GetHenchman(GetPCSpeaker()) != OBJECT_INVALID)
        return FALSE;
    return TRUE;
}
