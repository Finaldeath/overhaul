
void main()
{
    object oPC = GetFirstPC();
    object oJarvis = GetNearestObjectByTag("CT_UNIQ_SH_INST", oPC);

    ExecuteScript("conv_set_jour_03", oJarvis);
    SetCutsceneMode(oPC, FALSE);
}
