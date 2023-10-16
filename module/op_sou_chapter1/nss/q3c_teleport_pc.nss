// teleport pc to outside the caves

void main()
{
    object oPC = GetLastSpellCaster();
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    object oWP = GetWaypointByTag("wp_q7jnah_secretexit");
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));
    //Create Azath outside first time a PC uses this teleport
    if (GetLocalInt(GetModule(), "X1_AZATHCREATED") != 1)
    {
        SetLocalInt(GetModule(), "X1_AZATHCREATED", 1);
        CreateObject(OBJECT_TYPE_CREATURE, "q3_azath", GetLocation(oWP));

    }
}
