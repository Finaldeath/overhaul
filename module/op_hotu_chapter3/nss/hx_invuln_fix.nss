// Invuln fix
void main()
{
    object oPC = GetFirstPC();

    while(GetImmortal(oPC) == TRUE)
    {
        SetImmortal(oPC, FALSE);
    }
    while(GetPlotFlag(oPC) == TRUE)
    {
        SetPlotFlag(oPC, FALSE);
    }
}
