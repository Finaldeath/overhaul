//Make sure PC can't lock himself in the room
void main()
{
    object oPC = GetLastClosedBy();
    if (GetIsPC(oPC) == TRUE)
        SetLocked(OBJECT_SELF, FALSE);
}
