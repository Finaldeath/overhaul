// * Clear actions on any pc entering hell
// * so later conversations are not fuddled
// * Brent
void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsPC(oEnter) == TRUE)
    {
        AssignCommand(oEnter, ClearAllActions(TRUE));
    }
}
