// * Clear actions when you arrive at the realm of the reaper
void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsPC(oEnter) == TRUE)
    {
        AssignCommand(oEnter, ClearAllActions(TRUE));
    }
}
