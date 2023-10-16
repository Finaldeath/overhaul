
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(oPC, "X1_PCKNOWSBLUMBERG", 1);
    }

}
