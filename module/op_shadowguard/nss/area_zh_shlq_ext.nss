void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        SetLocalInt(GetModule(), "N_INTERLUDE", 0);
    }
}
