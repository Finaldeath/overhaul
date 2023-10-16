void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE)
    {
        DoSinglePlayerAutoSave();
    }
}
