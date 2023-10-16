int StartingConditional()
{
    object oGate = GetObjectByTag("Q5B_OX_DOOR");
    if (GetIsOpen(oGate) == TRUE || GetIsObjectValid(oGate) == FALSE)
        return TRUE;
    return FALSE;
}
