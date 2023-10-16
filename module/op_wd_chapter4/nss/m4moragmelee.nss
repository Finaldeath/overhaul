// * Morag's inner defenses have been breached
void main()
{   if (GetIsPC(GetEnteringObject()) == TRUE)
    if (GetLocalInt(GetModule(), "NW_L_MELEEMODE") == 0)
    {
        SetLocalInt(GetModule(), "NW_L_MELEEMODE", 10);
    }
}
