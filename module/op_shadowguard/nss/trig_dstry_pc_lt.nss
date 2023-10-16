void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC))
    {
        object oLight = GetNearestObjectByTag("PLAC_PC_LIGHT", oPC);

        DestroyObject(oLight);
    }
}
